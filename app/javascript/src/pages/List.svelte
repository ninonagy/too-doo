<script>
  import { navigate } from "svelte-routing";
  import { onMount } from "svelte";

  import { fade } from "svelte/transition";

  import Header from "../components/Header.svelte";
  import TodoInput from "../components/TodoInput.svelte";
  import TodoList from "../components/TodoList.svelte";
  import Footer from "../components/Footer.svelte";

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

<style>
  .container {
    max-width: 700px;
  }

  @media (max-width: 768px) {
    .container {
      width: 90%;
    }
  }
</style>

{#if loaded}
  <div class="container" transition:fade>
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

    <Footer />
  </div>
{/if}
