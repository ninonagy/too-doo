<script>
  export let checked = false;
  export let onClick;
</script>

<style>
  /* Container for checkmark */
  .box {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

  /* Hide the browser's default checkbox */
  .box input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;
  }

  /* Create a custom checkbox */
  .checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: white;
    border-color: black;
    border-width: 3px;
    border-style: solid;
    border-radius: 10%;
  }

  /* On mouse-over, add a grey background color */
  .box:hover input ~ .checkmark {
    /* background-color: #ccc; */
  }

  /* When the checkbox is checked, add a blue background */
  .box input:checked ~ .checkmark {
    background-color: black;
  }

  /* Create the checkmark/indicator (hidden when not checked) */
  .checkmark:after {
    content: "";
    position: absolute;
    display: none;
  }

  /* Show the checkmark when checked */
  .box input:checked ~ .checkmark:after {
    display: block;
  }

  /* Style the checkmark/indicator */
  .box .checkmark:after {
    left: 6px;
    top: 1px;
    width: 8px;
    height: 14px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
  }
</style>

<label class="box">
  <input type="checkbox" bind:checked on:input={onClick} />
  <span class="checkmark" />
</label>
