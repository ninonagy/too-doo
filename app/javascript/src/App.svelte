<script>
  import { Route, router } from "tinro";

  import HomePage from "./pages/Home.svelte";
  import ListPage from "./pages/List.svelte";
</script>

<Route path="/">
  <HomePage />
</Route>
<Route path="/list/:slug">
  <ListPage />
</Route>
<Route path="/error">
  <h1>404</h1>
</Route>

