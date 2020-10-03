<script>
  import { onMount } from "svelte";
  import { router } from "tinro";

  import Header from "../components/Header.svelte";
  import TodoInput from "../components/TodoInput.svelte";
  import TodoList from "../components/TodoList.svelte";

  import {
    getListWithTodos,
    saveList,
    createList,
    createTodo,
    saveTodo
  } from "../store";

  let list_id;
  let slug;
  let title;
  let todos = [];

  let params;
  // $: {
  //   // Load data when route param changes
  //   debugger;
  //   params = router.params($router);
  //   loadData();
  // }

  $: {
    console.log("list_id", list_id);
    console.log("slug", slug);
  }

  async function loadData() {
    slug = params.slug;
    let list = await getListWithTodos(slug);
    if (list) {
      list_id = list.id;
      title = list.title;
      todos = list.todos;
    } else {
      router.goto("/error");
    }
  }

  onMount(async () => {
    await loadData();
  });

  async function open() {
    let list = await createList();
    router.goto(`/list/${list.slug}`);
  }
</script>

<div class="container">
  <Header
    bind:title
    onUpdate={() => saveList({ list_id, title })}
    onNewList={open} />

  <TodoInput
    onInput={async todo => {
      todo = await createTodo({ ...todo, list_id });
      todos = [...todos, todo];
    }} />

  <TodoList bind:todos onUpdate={todo => saveTodo(todo)} />

  <footer style="margin-top: 200px; text-align: center;">
    <h2>Too Doo</h2>
    <p>Your to-dos have never been simpler.</p>
  </footer>
</div>
