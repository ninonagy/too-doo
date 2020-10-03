<script>
  export let title;
  export let onUpdate;
  export let onNewList;

  let titleEl;
  let editEl;
  let editable = false;

  function save() {
    title = titleEl.innerText;
    onUpdate();
  }

  function setCursor() {
    // Wait for editable value to update and
    // set cursor to the end of the title
    setTimeout(() => {
      var range = document.createRange();
      var sel = window.getSelection();

      range.setStart(titleEl.childNodes[0], titleEl.innerText.length);
      range.collapse(true);

      sel.removeAllRanges();
      sel.addRange(range);
    }, 50);
  }

  function clickOutside(event) {
    let isClickOutsideTitle =
      !titleEl.contains(event.target) && !editEl.contains(event.target);
    if (isClickOutsideTitle) {
      if (editable) save();
      editable = false;
    }
  }
</script>

<style>
  .header {
    position: relative;
    margin-top: 2em;
  }

  .header-title {
    display: inline-block;
  }

  .header-title-text {
    display: inline-block;
    font-style: normal;
    font-weight: 900;
    font-size: 32px;
    height: 39px;
    line-height: 39px;
    color: #000000;
    margin: 16px 0px;
  }

  .header-title-edit {
    display: inline-block;
    cursor: pointer;
  }
  .header-title-edit img {
    margin-left: 8px;
    position: relative;
    left: 12.5%;
    right: 12.49%;
    top: 12.49%;
    bottom: 12.5%;
  }
  .header-title-edit span {
    position: relative;
    top: -1.5px;
    left: 8px;

    font-style: normal;
    font-weight: bold;
    font-size: 14px;
    line-height: 17px;
    color: #777777;
  }

  .header-button {
    display: inline-block;
    position: absolute;
    right: 0;
    width: 100px;
    height: 43px;
    padding: 0;
    margin: 0;
    font-weight: 700;
    background: linear-gradient(180deg, #ffd976 0%, #f8be26 100%);
    border: 1px solid rgba(0, 0, 0, 0.1);
    box-sizing: border-box;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2);
    border-radius: 4px;
  }

  .outline {
    outline-color: black;
    outline-width: 2px;
    outline-style: solid;
    outline-offset: 6px;
  }
</style>

<svelte:body on:click={clickOutside} />

<div class="header is-full-width is-vertical-align">
  <div class="header-title">
    <h1
      id="header_title_text"
      class="header-title-text"
      bind:this={titleEl}
      class:outline={editable}
      contenteditable={editable}
      on:keypress={e => {
        if (e.keyCode === 13) {
          editable = false;
          save();
        } else editable = true;
      }}>
      {title}
    </h1>

    <div
      bind:this={editEl}
      class="header-title-edit"
      class:is-hidden={editable}
      on:click={() => {
        editable = true;
        setCursor();
      }}>
      <img src="/assets/icons/edit.svg" alt="edit" />
      <span>Edit</span>
    </div>
  </div>
  <button class="header-button" on:click={onNewList}>New List</button>
</div>
