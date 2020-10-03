import api from "./api";

export const getListWithTodos = async (slug) => {
  return api.get(`/api/lists/${slug}.json`);
};

export const createList = async () => {
  let list = await api.post(`/api/lists.json`);
  return list;
};

export const saveList = async ({ slug, title }) => {
  return api.put(`/api/lists/${slug}.json`, { title });
};

export const createTodo = async (todo) => {
  return api.post(`/api/todos.json`, todo);
};

export const saveTodo = async (todo) => {
  return api.put(`/api/todos/${todo.id}.json`, todo);
};
