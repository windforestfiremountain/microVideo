package edu.hhu.songxinning.service;

import edu.hhu.songxinning.entity.Video;

import java.util.List;

public interface VideoService {

    void add(Video video);

    void modify(Video video);

    void remove(int id);
    //接口中写Video_queryById
    Video queryById(int id);



    List<Video> queryAll();

}
