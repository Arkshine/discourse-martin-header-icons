import DButton from "discourse/components/d-button";

const DocumentIcon = <template>
  <li>
    <DButton
      @icon="book"
      @href="/calendar"
      @translatedLabel="Documents"
      @translatedTitle="Documents"
      class="doc-header-set"
    />
  </li>
</template>;

export default DocumentIcon;
