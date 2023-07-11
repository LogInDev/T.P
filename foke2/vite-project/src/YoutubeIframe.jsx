import axios from "axios";
import React, { useEffect, useState } from "react";

const YoutubeIframe = (props) => {
  const [store, setStore] = useState("");
  const [videoId, setVideoId] = useState("");

  const searchYoutube = async (newStore) => {
    try {
      setStore(props.store);
      const encodedKeyword = encodeURIComponent(newStore);
      const response = await axios.get(
        `https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=${encodedKeyword}&videoEmbeddable=True&type=video&key=AIzaSyA7A6_tMwo0qHxQFJzl0zqMi8TJdYcBb6I`
      );
      setVideoId(response.data.items[0].id.videoId);
      console.log("youtube<<<", response);
      console.log("youtube<<<", store);
      console.log("youtube<<<", props);
    } catch (error) {
      console.error("Error while sending text to Flask app:", error);
    }
  };
  useEffect(() => {
    searchYoutube(props.store);
  }, [props.store]);

  useEffect(() => {
    const timer = setTimeout(() => {
      setVideoId(videoId);
    }, 10000);

    return () => clearTimeout(timer);
  }, [videoId]);

  return (
    <div>
      <iframe
        width="560"
        height="315"
        src={`https://www.youtube.com/embed/${videoId}?autoplay=1&mute=1`}
        title="YouTube video player"
        frameBorder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowFullScreen
      />
    </div>
  );
};

export default YoutubeIframe;
