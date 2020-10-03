<script>
  import { uuid } from "../helpers";

  export let onInput;

  let value;

  function saveTodo() {
    if (value.length) {
      onInput({ value, done: false });
      value = "";
    }
  }
</script>

<style>
  .todo-input {
    margin-top: 60px;
    margin-bottom: 50px;
    position: relative;
  }
  .todo-input img {
    position: absolute;
    left: 22px;
  }
  .todo-input input {
    height: 56px;
    background: rgba(0, 0, 0, 0.05);
    border: none;
    outline: none;
    border-radius: 4px;
    font-size: 21px !important;
    line-height: 25px !important;
    padding-left: 56px !important;
    border: none !important;
  }
</style>

<div class="todo-input is-vertical-align">
  <img src="/assets/icons/plus.svg" alt="edit" />
  <input
    bind:value
    on:keypress={e => e.keyCode === 13 && saveTodo()}
    type="text"
    placeholder="Add a to-do..." />
</div>
