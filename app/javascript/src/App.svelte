<script>
  import { Router, Route } from "svelte-routing";

  import HomePage from "./pages/Home.svelte";
  import ListPage from "./pages/List.svelte";
</script>

<Router>
  <Route path="/" component={HomePage} />
  <Route path="/list/:slug" let:params>
    <ListPage slug={params.slug} />
  </Route>
  <Route path="/error">
    <h1>404</h1>
  </Route>
</Router>
