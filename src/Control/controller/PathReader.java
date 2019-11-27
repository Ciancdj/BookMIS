package Control.controller;

/**
 * 读取ClassPath的路径
 */
public class PathReader {
    public String getFilePath(String fileName) throws NullPointerException{
        ClassLoader classLoader = getClass().getClassLoader();
        return classLoader.getResource(fileName).getPath();
    }
}
