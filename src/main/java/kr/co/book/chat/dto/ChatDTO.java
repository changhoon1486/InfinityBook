package kr.co.book.chat.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("chat")
public class ChatDTO {
	
	// Library	
	private String library_idx;
	private String library_isbn;
	private String library_title;
	private String library_cover;
	private String library_author;
	private String library_info;
	
	// Club
	private String club_name; 
		
	// Chat
	private String chat_idx;
	private String code_idx;
	private String idx;
	private String chat_sender;
	private String chat_chat;
	private String chat_check;
	private String chat_date;
	
	// Member	
	private String member_idx;
	private String member_nickname;
	
	private String nicknames;
	
	// 상대방
	private String other;
		
	// 신청한 사람
	private String applyuser;

	public String getLibrary_idx() {
		return library_idx;
	}

	public void setLibrary_idx(String library_idx) {
		this.library_idx = library_idx;
	}

	public String getLibrary_isbn() {
		return library_isbn;
	}

	public void setLibrary_isbn(String library_isbn) {
		this.library_isbn = library_isbn;
	}

	public String getLibrary_title() {
		return library_title;
	}

	public void setLibrary_title(String library_title) {
		this.library_title = library_title;
	}

	public String getLibrary_cover() {
		return library_cover;
	}

	public void setLibrary_cover(String library_cover) {
		this.library_cover = library_cover;
	}

	public String getLibrary_author() {
		return library_author;
	}

	public void setLibrary_author(String library_author) {
		this.library_author = library_author;
	}

	public String getLibrary_info() {
		return library_info;
	}

	public void setLibrary_info(String library_info) {
		this.library_info = library_info;
	}

	public String getClub_name() {
		return club_name;
	}

	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}

	public String getChat_idx() {
		return chat_idx;
	}

	public void setChat_idx(String chat_idx) {
		this.chat_idx = chat_idx;
	}

	public String getCode_idx() {
		return code_idx;
	}

	public void setCode_idx(String code_idx) {
		this.code_idx = code_idx;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getChat_sender() {
		return chat_sender;
	}

	public void setChat_sender(String chat_sender) {
		this.chat_sender = chat_sender;
	}

	public String getChat_chat() {
		return chat_chat;
	}

	public void setChat_chat(String chat_chat) {
		this.chat_chat = chat_chat;
	}

	public String getChat_check() {
		return chat_check;
	}

	public void setChat_check(String chat_check) {
		this.chat_check = chat_check;
	}

	public String getChat_date() {
		return chat_date;
	}

	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}

	public String getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getNicknames() {
		return nicknames;
	}

	public void setNicknames(String nicknames) {
		this.nicknames = nicknames;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getApplyuser() {
		return applyuser;
	}

	public void setApplyuser(String applyuser) {
		this.applyuser = applyuser;
	}
	


}
