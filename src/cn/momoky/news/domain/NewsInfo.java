package cn.momoky.news.domain;

import java.sql.Timestamp;

/**
 * @ClassName NewsInfo
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/11 12:40
 * @Version 1.0
 */
public class NewsInfo {

    private Integer newsid;
    private String newstitle;
    private Integer typeid;
    private Timestamp newstime;
    private Integer authorid;
    private Integer click;
    private String content;
    private String picpath;
    private String keyword;

    public NewsInfo() {
    }

    public Integer getNewsid() {
        return newsid;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }

    public String getNewstitle() {
        return newstitle;
    }

    public void setNewstitle(String newstitle) {
        this.newstitle = newstitle;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Timestamp getNewstime() {
        return newstime;
    }

    public void setNewstime(Timestamp newstime) {
        this.newstime = newstime;
    }

    public Integer getAuthorid() {
        return authorid;
    }

    public void setAuthorid(Integer authorid) {
        this.authorid = authorid;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPicpath() {
        return picpath;
    }

    public void setPicpath(String picpath) {
        this.picpath = picpath;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "NewsInfo{" +
                "newsid=" + newsid +
                ", newstitle='" + newstitle + '\'' +
                ", typeid=" + typeid +
                ", newstime=" + newstime +
                ", authorid=" + authorid +
                ", click=" + click +
                ", content='" + content + '\'' +
                ", picpath='" + picpath + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
