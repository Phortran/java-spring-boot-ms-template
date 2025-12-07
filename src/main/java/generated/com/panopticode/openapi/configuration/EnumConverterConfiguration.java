package com.panopticode.openapi.configuration;

import com.panopticode.openapi.model.Difficulty;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;

@Configuration
public class EnumConverterConfiguration {

    @Bean(name = "com.panopticode.openapi.configuration.EnumConverterConfiguration.difficultyConverter")
    Converter<String, Difficulty> difficultyConverter() {
        return new Converter<String, Difficulty>() {
            @Override
            public Difficulty convert(String source) {
                return Difficulty.fromValue(source);
            }
        };
    }

}
