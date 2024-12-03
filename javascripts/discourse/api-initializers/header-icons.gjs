import { setOwner } from "@ember/owner";
import { withPluginApi } from "discourse/lib/plugin-api";
import CalendarIcon from "../components/calendar-icon";
import DocumentIcon from "../components/document-icon";

class HeaderIcons {
  constructor(owner) {
    setOwner(this, owner);

    withPluginApi("1.28.0", (api) => {
      api.headerIcons.add("document", DocumentIcon, { before: "search" });
      api.headerIcons.add("calendar", CalendarIcon, { before: "search" });
    });
  }
}

export default {
  name: "martin-header-icons",

  initialize(owner) {
    this.instance = new HeaderIcons(owner);
  },

  tearDown() {
    this.instance = null;
  },
};
