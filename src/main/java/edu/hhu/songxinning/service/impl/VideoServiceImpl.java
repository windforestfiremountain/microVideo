package edu.hhu.songxinning.service.impl;

import edu.hhu.songxinning.dao.VideoDao;
import edu.hhu.songxinning.dao.impl.VideoDaoImpl;
import edu.hhu.songxinning.entity.Video;
import edu.hhu.songxinning.service.VideoService;

import java.util.List;

public class VideoServiceImpl implements VideoService {
   private VideoDao videoDao = new VideoDaoImpl();

    @Override
    public void add(Video video) {
        videoDao.insert(video);
    }

    @Override
    public void modify(Video video) {
        videoDao.update(video);
    }

    @Override
    public void remove(int id) {
        videoDao.deleteById(id);
    }

    @Override
    public Video queryById(int id) {
        return videoDao.selectById(id);
    }

    @Override
    public List<Video> queryAll() {
        return videoDao.selectAll();
    }
}
