package com.foke.demo.controller;

import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.foke.demo.service.CartService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/cart/api")
@RequiredArgsConstructor
public class CartApiController {
    private final CartService cartService;

    @GetMapping("/most-added-products")
    public ResponseEntity<List<Object[]>> getMostAddedProducts() {
        List<Object[]> mostAddedProducts = this.cartService.getMostAddedProducts();

        return ResponseEntity.ok(mostAddedProducts);
    }
    
    @GetMapping("/most-added-store")
    public ResponseEntity<List<Object[]>> getMostAddedStore() {
        List<Object[]> mostAddedStore = this.cartService.getMostAddedStore();

        return ResponseEntity.ok(mostAddedStore);
    }
}
