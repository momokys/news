package cn.momoky.news.domain;

/**
 * @ClassName NewsType
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/10 16:07
 * @Version 1.0
 */
public class NewsType {
    private Integer typeid;
    private String typename;
    private String remark;

    public NewsType() {
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "NewsType{" +
                "typeid=" + typeid +
                ", typename='" + typename + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
