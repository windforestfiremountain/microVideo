package edu.hhu.songxinning.dao;

import edu.hhu.songxinning.entity.Video;

import java.util.List;

public interface VideoDao {

    void insert(Video video);

    void update(Video video);

    Video selectById(int id);

    void deleteById(int id);

    List<Video> selectAll();
}
