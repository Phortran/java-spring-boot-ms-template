package com.panopticode.openapi.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonValue;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import jakarta.validation.Valid;
import jakarta.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import jakarta.annotation.Generated;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * Recipe difficulty
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2025-12-07T11:55:54.264385344Z[Europe/London]", comments = "Generator version: 7.12.0")
public enum Difficulty {
  
  EASY("easy"),
  
  MEDIUM("medium"),
  
  HARD("hard");

  private String value;

  Difficulty(String value) {
    this.value = value;
  }

  @JsonValue
  public String getValue() {
    return value;
  }

  @Override
  public String toString() {
    return String.valueOf(value);
  }

  @JsonCreator
  public static Difficulty fromValue(String value) {
    for (Difficulty b : Difficulty.values()) {
      if (b.value.equals(value)) {
        return b;
      }
    }
    throw new IllegalArgumentException("Unexpected value '" + value + "'");
  }
}

