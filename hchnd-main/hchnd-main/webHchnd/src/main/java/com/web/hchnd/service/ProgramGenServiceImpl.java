package com.web.hchnd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.hchnd.mapper.ProgramGenMapper;


@Service
public class ProgramGenServiceImpl implements ProgramGenService{
	@Inject
    ProgramGenMapper mapper;


}