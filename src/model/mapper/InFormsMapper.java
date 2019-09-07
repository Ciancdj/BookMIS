package model.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.pojo.InForms;


@Repository
public interface InFormsMapper {
	public List<InForms> listAll(int bookid);
	public InForms state(String bookcode);
}
