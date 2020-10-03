<script>
  import { navigate } from "svelte-routing";
  import { onMount } from "svelte";

  import { createList } from "../store.js";

  onMount(async () => {
    let slug = (await createList()).slug;
    navigate(`/list/${slug}`, { replace: true });
  });
</script>
