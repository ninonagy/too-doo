// const request = (method) => async (url, data) => {
//   return fetch(url, {
//     method,
//     headers: {
//       "Content-Type": "application/json",
//     },
//     body: JSON.stringify(data),
//   }).then(async (response) => {
//     if (response.ok) {
//       return response.json().catch(() => ({}));
//     } else {
//       throw new Error(response.statusText);
//     }
//   });
// };

const request = (method) => async (url, data) => {
  return fetch(url, {
    method,
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  }).then(async (response) => {
    return response.json();
  });
};

const api = {
  get: request("GET"),
  post: request("POST"),
  put: request("PUT"),
  delete: request("DELETE"),
};

export default api;
