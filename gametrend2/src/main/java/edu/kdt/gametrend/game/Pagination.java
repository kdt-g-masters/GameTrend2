package edu.kdt.gametrend.game;

public class Pagination {
		private int listSize = 3;
		private int rangeSize = 3;
		private int page, range, listCnt, pageCnt, startPage, startList, endPage;
		private boolean prev, next;
		
		public int getListSize() {
			return listSize;
		}
		public void setListSize(int listSize) {
			this.listSize = listSize;
		}
		public int getPage() {
			return page;
		}
		public void setPage(int page) {
			this.page = page;
		}
		public int getRange() {
			return range;
		}
		public void setRange(int range) {
			this.range = range;
		}
		public int getRangeSize() {
			return rangeSize;
		}
		public int getListCnt() {
			return listCnt;
		}
		public void setListCnt(int listCnt) {
			this.listCnt = listCnt;
		}
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public int getEndPage() {
			return endPage;
		}
		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}
		public boolean isPrev() {
			return prev;
		}
		public void setPrev(boolean prev) {
			this.prev = prev;
		}
		public boolean isNext() {
			return next;
		}
		public void setNext(boolean next) {
			this.next = next;
		}
		public int getStartList() {
			return startList;
		}
		//page: 현재페이지, range: 현재 페이지 범위, listCnt: 게임 총 개수
		public void pageInfo(int page, int range, int listCnt) {
			this.page = page;
			this.range = range;
			this.listCnt = listCnt;
			
			//전체 페이지수
			this.pageCnt = (int)Math.ceil(listCnt/listSize);
			
			//시작 페이지
			this.startPage = (range-1)*rangeSize + 1;
			
			//끝 페이지
			this.endPage = range * rangeSize;
			
			//시작번호
			this.startList = (page -1) * listSize;
			
			//이전 버튼 상태
			this.prev = range == 1 ? false : true;
			
			//다음 버튼 상태
			this.next = endPage > pageCnt ? false : true;
			if(this.endPage > this.pageCnt) {
				this.endPage = this.pageCnt;
				this.next = false;
			}
		}

}
