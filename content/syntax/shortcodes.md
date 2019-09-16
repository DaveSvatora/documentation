---
title: Shortcodes Examples
description : "Disclaimers to help you structure your page"
---

#### Expand

```
{{%/*expand "Is this learn theme rocks ?" */%}}Yes !.{{%/* /expand*/%}}
```

renders as

{{%expand "Is this learn theme rocks ?" %}}Yes !.{{% /expand%}}

---

#### Mermaid

```
{{</*mermaid align="left"*/>}}
graph LR;
	A[Hard edge] -->|Link text| B(Round edge)
   	B --> C{Decision}
   	C -->|One| D[Result one]
   	C -->|Two| E[Result two]
{{</* /mermaid */>}}
```

renders as

{{<mermaid align="left">}}
graph LR;
    A[Hard edge] -->|Link text| B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
{{< /mermaid >}}

---

#### Instagram

```
{{</* instagram BWNjjyYFxVx hidecaption */>}}
```

renders as

{{< instagram BWNjjyYFxVx hidecaption >}}

---

#### Tweet

```
{{</* tweet 877500564405444608 */>}}
```

renders as

{{< tweet 877500564405444608 >}}

---

#### Vimeo

```
{{</* vimeo 146022717 */>}}
```

renders as

{{< vimeo 146022717 >}}

---

#### Youtube

```
{{</* youtube w7Ft2ymGmfc */>}}
```

renders as

{{< youtube w7Ft2ymGmfc >}}