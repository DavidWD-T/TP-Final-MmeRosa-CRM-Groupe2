package com.example.tpfinalmmerosacrmgroupe2.api;

import java.time.LocalDateTime;

public class EventDTO {
    private Long id;
    String title;
    String URL;
    private LocalDateTime start;
    private LocalDateTime end;

    public EventDTO() {
    }

    public EventDTO(Long id, String title, String URL, LocalDateTime start, LocalDateTime end) {
        this.id = id;
        this.title = title;
        this.URL = URL;
        this.start = start;
        this.end = end;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public LocalDateTime getStart() {
        return start;
    }

    public void setStart(LocalDateTime start) {
        this.start = start;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public void setEnd(LocalDateTime end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "Event [id=" + id + ", title=" + title + ", URL=" + URL + ", start=" + start
                + ", end=" + end + "]";
    }
}
