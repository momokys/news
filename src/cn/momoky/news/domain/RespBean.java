package cn.momoky.news.domain;

/**
 * @ClassName RespBean
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/10 16:10
 * @Version 1.0
 */
public class RespBean<T> {

    private Integer code = 0;
    private String msg = "";
    private Integer count;
    private T data;

    public RespBean() {
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "RespBean{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}
