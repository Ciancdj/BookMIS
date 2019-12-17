package Control.controller;

import model.pojo.Users;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class UsersMapHolding {
    // 用户和SessionId绑定关系
    public static final Map<String, String> USR_SESSION = new ConcurrentHashMap<>();
    // SessionId和Users的绑定关系
    public static final Map<String, Users> SESSIONID_USR = new ConcurrentHashMap<>();
}
