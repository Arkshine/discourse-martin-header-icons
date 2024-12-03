import Component from "@glimmer/component";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";

export default class CalendarIcon extends Component {
  @service currentUser;

  get shutter() {
    if (settings.tool_status.trim()) {
      const cache = JSON.parse(settings.tool_status);
      const shutter = cache?.tools[4];
      return shutter;
    }

    return null;
  }

  get icon() {
    if (!this.shutter) {
      return "calendar";
    }

    return this.shutter ? "calendar-check" : "calendar-alt";
  }

  get translatedTitle() {
    if (!this.shutter) {
      return "Open status: unknown";
    }

    return (
      (this.shutter.status ? `Open since` : "Close since") +
      " " +
      this.shutter.data
    );
  }

  get href() {
    return "/calendar";
  }

  get class() {
    return "btn no-text icon btn-flat shutter-status";
  }

  get shouldShow() {
    return settings.shutter_tick_enable;
  }

  <template>
    {{#if this.shouldShow}}
      <li>
        <DButton
          @icon={{this.icon}}
          @href={{this.href}}
          @translatedTitle={{this.translatedTitle}}
          class={{this.class}}
        />
      </li>
    {{/if}}
  </template>
}
