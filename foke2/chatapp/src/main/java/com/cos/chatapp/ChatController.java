package com.cos.chatapp;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

@RequiredArgsConstructor
@RestController // 데이터 리턴 서버
public class ChatController {

	private final ChatRepository chatRepository;

	// 귓솔말 할 때 사용
	@CrossOrigin
	@GetMapping(value = "/sender/{sender}/receiver/{receiver}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public Flux<Chat> getMsg(@PathVariable String sender, @PathVariable String receiver) {
		return chatRepository.mFindBySender(sender).subscribeOn(Schedulers.boundedElastic());
	}

	@CrossOrigin
	@GetMapping(value = "/chat/roomNum/{roomNum}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public Flux<Chat> findByRoomNum(@PathVariable String roomNum) {
		return chatRepository.mFindByRoomNum(roomNum).subscribeOn(Schedulers.boundedElastic());
	}

//	@CrossOrigin
//	@PostMapping("/chat")
//	public Mono<Chat> setMsg(@RequestBody Chat chat) {
//		chat.setCreatedAt(LocalDateTime.now());
//		Flux<Chat> chatsBySender = chatRepository.mFindBySender(chat.getSender());
//
//	    return chatsBySender.collectList()
//	        .doOnNext(chatList -> System.out.println("Got chatList: " + chatList))
//	        .map(chatList -> {
//	            Optional<Chat> mostRecentChat = chatList.stream()
//	                .max(Comparator.comparing(Chat::getCreatedAt));
//	            if (mostRecentChat.isPresent()) {
//	                chat.setPushNum(mostRecentChat.get().getPushNum() + 1);
//	            } else {
//	                chat.setPushNum(1);
//	            }
//	            return chat;
//	        })
//	        .doOnNext(updatedChat -> System.out.println("Updated chat: " + updatedChat))
//	        .flatMap(chatRepository::save);
//	        //.doOnNext(savedChat -> System.out.println("여기여기>>" + savedChat.getPushNum()));
//	}

	@CrossOrigin
	@PostMapping("/chat")
	public Mono<Chat> setMsg(@RequestBody Chat chat) {
	    chat.setCreatedAt(LocalDateTime.now());
	    Flux<Chat> chatsInSameRoom = chatRepository.mFindByRoomNumm(chat.getRoomNum());

	    return chatsInSameRoom.collectList()
	        .flatMap(chatList -> {
	            Optional<Chat> mostRecentChat = chatList.stream()
	                .max(Comparator.comparing(Chat::getCreatedAt));

	            if (mostRecentChat.isPresent() && mostRecentChat.get().getSender().equals("admin")) {
	                chat.setPushNum(0);
	                return Mono.just(chat);
	            } else {
	                return chatRepository.mFindBySender(chat.getSender())
	                    .collectList()
	                    .flatMap(chatsBySender -> {
	                        Optional<Chat> mostRecentChatBySender = chatsBySender.stream()
	                            .max(Comparator.comparing(Chat::getCreatedAt));
	                        if (mostRecentChatBySender.isPresent()) {
	                            chat.setPushNum(mostRecentChatBySender.get().getPushNum() + 1);
	                        } else {
	                            chat.setPushNum(1);
	                        }
	                        return Mono.just(chat);
	                    });
	            }
	        })
	        .flatMap(chatRepository::save);
	}




	
	
	@CrossOrigin
	@PostMapping("/chatAdmin")
	public Mono<Chat> setMsgAdmin(@RequestBody Chat chat) {
		chat.setCreatedAt(LocalDateTime.now());
	    String roomNum = chat.getRoomNum();
	    String sender = roomNum.substring(0, roomNum.length() - 1);
	    
	    // sender와 같은 sender를 찾아서 pushNum을 0으로 수정
//	    chatRepository.mFindBySender(sender)
//	            .filter(existingChat -> !existingChat.equals(chat))
//	            .doOnNext(existingChat -> {
//	                existingChat.setPushNum(0);
//	                chatRepository.save(existingChat).subscribe();
//	            })
//	            .subscribe(); //Execution 지시

	    return chatRepository.save(chat); // 입력된 chat 객체의 값을 수정하지 않고 저장함, Object를 리턴하면 자동으로 JSON 변환 (MessageConverter)
	}


	@CrossOrigin(origins = {"http://192.168.0.17:8080", "http://localhost:8080"})
	@GetMapping("/distinct-sender")
	public Mono<List<String>> getDistinctSender() {
	    return chatRepository.findDistinctSenderChatsExclude("admin")
	            .filter(chat -> chat.getSender() != null)
	            .map(Chat::getSender)
	            .distinct()
	            .collectList();
	}

}
