package com.command.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//인터페이스

public interface Command {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
