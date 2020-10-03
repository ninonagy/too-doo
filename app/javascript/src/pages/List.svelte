<script>
  import { navigate } from "svelte-routing";
  import { onMount } from "svelte";

  import Header from "../components/Header.svelte";
  import TodoInput from "../components/TodoInput.svelte";
  import TodoList from "../components/TodoList.svelte";

  import {
    listStore,
    getListWithTodos,
    saveList,
    createList,
    createTodo,
    saveTodo
  } from "../store";

  export let slug;

  let id;
  let title;
  let todos;
  let loaded = false;

  // Fetch new data when slug changes
  $: fetchData(slug);

  async function fetchData(slug) {
    let _ = ({ id, title, todos } = await getListWithTodos(slug));
    loaded = true;
  }

  async function open() {
    let list = await createList();
    navigate(`/list/${list.slug}`);
  }
</script>

{#if loaded}
  <div class="container">
    <Header
      bind:title
      onUpdate={async () => {
        await saveList({ slug, title });
      }}
      onNewList={open} />

    <TodoInput
      onInput={async todo => {
        todo = await createTodo({ ...todo, list_id: id });
        todos = [...todos, todo];
      }} />

    <TodoList bind:todos onUpdate={todo => saveTodo(todo)} />

    <footer style="margin-top: 200px; text-align: center;">
      <h2>Too Doo</h2>
      <p>Your to-dos have never been simpler.</p>
    </footer>
  </div>
{/if}
