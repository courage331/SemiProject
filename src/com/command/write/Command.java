package com.command.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//1028 이호인 15:39
public interface Command {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
