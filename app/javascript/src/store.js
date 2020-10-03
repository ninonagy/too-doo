import api from "./api";

const getListWithTodos = async (slug) => api.get(`/api/lists/${slug}.json`);

const createList = async () => api.post(`/api/lists.json`);

const saveList = async ({ slug, title }) =>
  api.put(`/api/lists/${slug}.json`, { title });

const createTodo = async (todo) => api.post(`/api/todos.json`, todo);

const saveTodo = async (todo) => api.put(`/api/todos/${todo.id}.json`, todo);

export { getListWithTodos, createList, saveList, createTodo, saveTodo };
