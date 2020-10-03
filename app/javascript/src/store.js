// import { writable } from "svelte/store";

import api from "./api";

// export const listsStore = writable([]);

export const getListWithTodos = async (slug) => {
  return api.get(`/api/lists/${slug}.json`);
};

export const createList = async () => {
  return api.post(`/api/lists.json`);
};

export const saveList = async ({ list_id, title }) => {
  return api.put(`/api/lists/${list_id}.json`, { title });
};

export const createTodo = async (todo) => {
  return api.post(`/api/todos.json`, todo);
};

export const saveTodo = async (todo) => {
  return api.put(`/api/todos/${todo.id}.json`, todo);
};
