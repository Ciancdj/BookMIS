package model.service;

import java.util.List;

import model.pojo.InForms;

public interface InFormsService {
	List<InForms> list(int bookid);
	boolean state(String BookCode);
}
