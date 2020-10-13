package cn.momoky.news.domain;

/**
 * @ClassName User
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/10 13:52
 * @Version 1.0
 */
public class User {

    private Integer uid;
    private String username;
    private String userpwd;
    private Integer level;

    public User() {
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

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", userpwd='" + userpwd + '\'' +
                ", level=" + level +
                '}';
    }
}
