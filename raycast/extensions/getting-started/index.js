"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/index.tsx
var src_exports = {};
__export(src_exports, {
  default: () => Command
});
module.exports = __toCommonJS(src_exports);
var import_api = require("@raycast/api");
var import_jsx_runtime = require("react/jsx-runtime");
function Command() {
  return /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(import_api.List, { children: [
    /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(import_api.List.Section, { title: "Basics", children: [
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(LinkListItem, { title: "Familiarize yourself with Raycast", link: "https://raycast.com/manual" }),
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(LinkListItem, { title: "Install extensions from our public store", link: "https://www.raycast.com/store" }),
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(LinkListItem, { title: "Build your own extensions with our API", link: "https://developers.raycast.com" }),
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(LinkListItem, { title: "Invite your teammates", link: "raycast://organizations/lawson-guilbeau/manage" })
    ] }),
    /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(import_api.List.Section, { title: "Next Steps", children: [
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(LinkListItem, { title: "Join the Raycast community", link: "https://raycast.com/community" }),
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(LinkListItem, { title: "Stay up to date via Twitter", link: "https://twitter.com/raycastapp" })
    ] })
  ] });
}
function LinkListItem(props) {
  return /* @__PURE__ */ (0, import_jsx_runtime.jsx)(
    import_api.List.Item,
    {
      title: props.title,
      icon: import_api.Icon.Link,
      accessories: [{ text: props.link }],
      actions: /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(import_api.ActionPanel, { children: [
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Action.OpenInBrowser, { url: props.link }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Action.CopyToClipboard, { title: "Copy Link", content: props.link })
      ] })
    }
  );
}
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vcmF5Y2FzdC1leHRlbnNpb25zL2dldHRpbmctc3RhcnRlZC9zcmMvaW5kZXgudHN4Il0sCiAgInNvdXJjZXNDb250ZW50IjogWyJpbXBvcnQgeyBBY3Rpb25QYW5lbCwgQWN0aW9uLCBJY29uLCBMaXN0IH0gZnJvbSBcIkByYXljYXN0L2FwaVwiO1xuXG5leHBvcnQgZGVmYXVsdCBmdW5jdGlvbiBDb21tYW5kKCkge1xuICByZXR1cm4gKFxuICAgIDxMaXN0PlxuICAgICAgPExpc3QuU2VjdGlvbiB0aXRsZT1cIkJhc2ljc1wiPlxuICAgICAgICA8TGlua0xpc3RJdGVtIHRpdGxlPVwiRmFtaWxpYXJpemUgeW91cnNlbGYgd2l0aCBSYXljYXN0XCIgbGluaz1cImh0dHBzOi8vcmF5Y2FzdC5jb20vbWFudWFsXCIgLz5cbiAgICAgICAgPExpbmtMaXN0SXRlbSB0aXRsZT1cIkluc3RhbGwgZXh0ZW5zaW9ucyBmcm9tIG91ciBwdWJsaWMgc3RvcmVcIiBsaW5rPVwiaHR0cHM6Ly93d3cucmF5Y2FzdC5jb20vc3RvcmVcIiAvPlxuICAgICAgICA8TGlua0xpc3RJdGVtIHRpdGxlPVwiQnVpbGQgeW91ciBvd24gZXh0ZW5zaW9ucyB3aXRoIG91ciBBUElcIiBsaW5rPVwiaHR0cHM6Ly9kZXZlbG9wZXJzLnJheWNhc3QuY29tXCIgLz5cbiAgICAgICAgPExpbmtMaXN0SXRlbSB0aXRsZT1cIkludml0ZSB5b3VyIHRlYW1tYXRlc1wiIGxpbms9XCJyYXljYXN0Oi8vb3JnYW5pemF0aW9ucy9sYXdzb24tZ3VpbGJlYXUvbWFuYWdlXCIgLz5cbiAgICAgIDwvTGlzdC5TZWN0aW9uPlxuICAgICAgPExpc3QuU2VjdGlvbiB0aXRsZT1cIk5leHQgU3RlcHNcIj5cbiAgICAgICAgPExpbmtMaXN0SXRlbSB0aXRsZT1cIkpvaW4gdGhlIFJheWNhc3QgY29tbXVuaXR5XCIgbGluaz1cImh0dHBzOi8vcmF5Y2FzdC5jb20vY29tbXVuaXR5XCIgLz5cbiAgICAgICAgPExpbmtMaXN0SXRlbSB0aXRsZT1cIlN0YXkgdXAgdG8gZGF0ZSB2aWEgVHdpdHRlclwiIGxpbms9XCJodHRwczovL3R3aXR0ZXIuY29tL3JheWNhc3RhcHBcIiAvPlxuICAgICAgPC9MaXN0LlNlY3Rpb24+XG4gICAgPC9MaXN0PlxuICApO1xufVxuXG5mdW5jdGlvbiBMaW5rTGlzdEl0ZW0ocHJvcHM6IHsgdGl0bGU6IHN0cmluZzsgbGluazogc3RyaW5nIH0pIHtcbiAgcmV0dXJuIChcbiAgICA8TGlzdC5JdGVtXG4gICAgICB0aXRsZT17cHJvcHMudGl0bGV9XG4gICAgICBpY29uPXtJY29uLkxpbmt9XG4gICAgICBhY2Nlc3Nvcmllcz17W3sgdGV4dDogcHJvcHMubGluayB9XX1cbiAgICAgIGFjdGlvbnM9e1xuICAgICAgICA8QWN0aW9uUGFuZWw+XG4gICAgICAgICAgPEFjdGlvbi5PcGVuSW5Ccm93c2VyIHVybD17cHJvcHMubGlua30gLz5cbiAgICAgICAgICA8QWN0aW9uLkNvcHlUb0NsaXBib2FyZCB0aXRsZT1cIkNvcHkgTGlua1wiIGNvbnRlbnQ9e3Byb3BzLmxpbmt9IC8+XG4gICAgICAgIDwvQWN0aW9uUGFuZWw+XG4gICAgICB9XG4gICAgLz5cbiAgKTtcbn1cbiJdLAogICJtYXBwaW5ncyI6ICI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBLGlCQUFnRDtBQUsxQztBQUhTLFNBQVIsVUFBMkI7QUFDaEMsU0FDRSw2Q0FBQyxtQkFDQztBQUFBLGlEQUFDLGdCQUFLLFNBQUwsRUFBYSxPQUFNLFVBQ2xCO0FBQUEsa0RBQUMsZ0JBQWEsT0FBTSxxQ0FBb0MsTUFBSyw4QkFBNkI7QUFBQSxNQUMxRiw0Q0FBQyxnQkFBYSxPQUFNLDRDQUEyQyxNQUFLLGlDQUFnQztBQUFBLE1BQ3BHLDRDQUFDLGdCQUFhLE9BQU0sMENBQXlDLE1BQUssa0NBQWlDO0FBQUEsTUFDbkcsNENBQUMsZ0JBQWEsT0FBTSx5QkFBd0IsTUFBSyxrREFBaUQ7QUFBQSxPQUNwRztBQUFBLElBQ0EsNkNBQUMsZ0JBQUssU0FBTCxFQUFhLE9BQU0sY0FDbEI7QUFBQSxrREFBQyxnQkFBYSxPQUFNLDhCQUE2QixNQUFLLGlDQUFnQztBQUFBLE1BQ3RGLDRDQUFDLGdCQUFhLE9BQU0sK0JBQThCLE1BQUssa0NBQWlDO0FBQUEsT0FDMUY7QUFBQSxLQUNGO0FBRUo7QUFFQSxTQUFTLGFBQWEsT0FBd0M7QUFDNUQsU0FDRTtBQUFBLElBQUMsZ0JBQUs7QUFBQSxJQUFMO0FBQUEsTUFDQyxPQUFPLE1BQU07QUFBQSxNQUNiLE1BQU0sZ0JBQUs7QUFBQSxNQUNYLGFBQWEsQ0FBQyxFQUFFLE1BQU0sTUFBTSxLQUFLLENBQUM7QUFBQSxNQUNsQyxTQUNFLDZDQUFDLDBCQUNDO0FBQUEsb0RBQUMsa0JBQU8sZUFBUCxFQUFxQixLQUFLLE1BQU0sTUFBTTtBQUFBLFFBQ3ZDLDRDQUFDLGtCQUFPLGlCQUFQLEVBQXVCLE9BQU0sYUFBWSxTQUFTLE1BQU0sTUFBTTtBQUFBLFNBQ2pFO0FBQUE7QUFBQSxFQUVKO0FBRUo7IiwKICAibmFtZXMiOiBbXQp9Cg==
