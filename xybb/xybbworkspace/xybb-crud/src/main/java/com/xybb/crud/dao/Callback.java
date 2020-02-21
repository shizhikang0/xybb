package com.xybb.crud.dao;

public interface Callback<T,E> {
    public T doCallback(E e);
}
