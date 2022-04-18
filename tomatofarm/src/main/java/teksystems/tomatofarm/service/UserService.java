package teksystems.tomatofarm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import teksystems.tomatofarm.database.dao.UserDAO;

@Service
public class UserService {
    @Autowired
    private UserDAO userDao;
}
