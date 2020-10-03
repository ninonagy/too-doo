<script>
  import Checkmark from "./Checkmark.svelte";
  export let todos = [];
  export let onUpdate;
</script>

<style>
  ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
    min-height: 250px;
    height: auto;
  }
  ul li {
    margin-bottom: 32px;
  }
  .todo-list .item {
    padding-left: 42px;
  }
</style>

<ul class="todo-list">
  {#each todos as todo}
    <li>
      <Checkmark
        checked={todo.done}
        onClick={() => {
          todo.done = !todo.done;
          onUpdate(todo);
        }} />
      <span class="item">{todo.value}</span>
    </li>
  {/each}
</ul>
