package cn.momoky.news.domain;

import com.alibaba.fastjson.annotation.JSONField;

import java.sql.Timestamp;

/**
 * @ClassName VNewInfo
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/11 13:07
 * @Version 1.0
 */
public class VNewInfo {

    private Integer newsid;
    private String newstitle;

    private Integer typeid;
    private String typename;

    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Timestamp newstime;

    private Integer uid;
    private String username;
    private Integer click;
    private String content;
    private String picpath;
    private String keyword;


    public VNewInfo() {
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

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Timestamp getNewstime() {
        return newstime;
    }

    public void setNewstime(Timestamp newstime) {
        this.newstime = newstime;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
        return "VNewInfo{" +
                "newsid=" + newsid +
                ", newstitle='" + newstitle + '\'' +
                ", typeid=" + typeid +
                ", typename='" + typename + '\'' +
                ", newstime=" + newstime +
                ", uid=" + uid +
                ", username='" + username + '\'' +
                ", click=" + click +
                ", content='" + content + '\'' +
                ", picpath='" + picpath + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
