package cn.momoky.news.domain;



public class PageBean {
	/**
	 * 当前页
	 */
	private Integer currentPage;
	
	/**
	 * 每页显示条数
	 */
	private Integer pageCount;
	
	/**
	 * 总条数
	 */
	private Integer totalCount;
	
	/**
	 * 总页数
	 */
	private Integer totalPage;
	
	
	public PageBean(Integer totalCount, Integer pageCount, Integer currentPage) {
		
		this.totalCount = totalCount;
		this.pageCount = pageCount;
		this.currentPage = currentPage;
		
		this.totalPage = (int) Math.ceil(1.0*totalCount / pageCount);
		if (totalPage < 1) this.totalPage = 1;
	}
	
	/**
	 * 获取 sql 分页查询开始索引
	 * @return 开始索引
	 */
	public Integer getStart() {
		return (this.currentPage - 1) * this.pageCount;
	}
	
	/**
	 * 设置当前页为起始页
	 * @return 当前页
	 */
	public Integer first() {
		Integer c = this.currentPage;
		this.currentPage = 1;
		return c;
	}
	
	/**
	 * 设置当前页为结束页
	 * @return 当前页
	 */
	public Integer last() {
		Integer c = this.currentPage;
		this.currentPage = totalPage;
		return c;
	}
	
	/**
	 * 获取当前页
	 * @return
	 */
	public Integer getCurrentPage() {
		return this.currentPage;
	}
	
	/**
	 * 设置下一页
	 * @return 当前页
	 */
	public Integer next() {
		Integer c = this.currentPage;
		
		this.currentPage = this.currentPage+1 < this.totalPage
						   ? this.currentPage + 1
						   : this.totalPage;
		return c;
	}
	
	/**
	 * 设置上一页
	 * @return 当前页
	 */
	public Integer prev() {
		Integer c = this.currentPage;
		this.currentPage = this.currentPage - 1 > 0 
						   ? this.currentPage-1
						   : 1;
		return c;
	}

	
	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	
	
}
