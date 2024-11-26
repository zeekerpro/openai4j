package com.theokanning.openai.completion.chat;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

/**
 * @author Allen Hu
 * @date 2024/11/6
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
class AssistantMessageAudio {

    /**
     * Unique identifier for a previous audio response from the model.
     */
    @NonNull
    private String id;

    /**
     * The Unix timestamp (in seconds) for when this audio response will no longer be accessible on the server for use in multi-turn conversations.
     */
    @JsonProperty("expires_at")
    private Integer expiresAt;

    /**
     * Transcript of the audio generated by the model.
     */
    private String transcript;

    /**
     * Base64 encoded audio bytes generated by the model, in the format specified in the request.
     */
    private String data;
}