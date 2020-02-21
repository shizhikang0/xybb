package com.xybb.sso.dao;

public interface Callback<T,E> {
    public T doCallback(E e);
}
