---
title: Creating A Website Widget From A Gradio Chatbot
source: https://www.gradio.app/guides/creating-a-website-widget-from-a-gradio-chatbot
author:
    - "[[Gradio Team]]"
published:
created: 2026-04-08
description: A Step-by-Step Gradio Tutorial
tags:
    - clippings
---
## Related

- [[20 DOCUMENTATION/HuggingFace Docs/AGENTS]]
- [[Spaces Configuration Reference]]

## Type

type:: system

- system

parent: "HuggingFace.base"

type: "system"

---

- [[HuggingFace.base]]

## Related

- [[20 DOCUMENTATION/HuggingFace Docs/AGENTS]]
- [[Spaces Configuration Reference]]

## Type

- system

## Client Side Functions

![Gradio logo|135](https://www.gradio.app/_app/immutable/assets/gradiodark.CbgYRzQH.svg)

Gradio allows you to run certain "simple" functions directly in the browser by setting `js=True` in your event listeners. This will **automatically convert your Python code into JavaScript**, which significantly improves the responsiveness of your app by avoiding a round trip to the server for simple UI updates.

The difference in responsiveness is most noticeable on hosted applications (like Hugging Face Spaces), when the server is under heavy load, with high-latency connections, or when many users are accessing the app simultaneously.

### When to Use Client Side Functions

Client side functions are ideal for updating component properties (like visibility, placeholders, interactive state, or styling).

Here's a basic example:

```py
import gradio as gr

with gr.Blocks() as demo:
    with gr.Row() as row:
        btn = gr.Button("Hide this row")

    # This function runs in the browser without a server roundtrip
    btn.click(
        lambda: gr.Row(visible=False),
        None,
        row,
        js=True
    )

demo.launch()
```

### Limitations

Client side functions have some important restrictions:

- They can only update component properties (not values)
- They cannot take any inputs

Here are some functions that will work with `js=True`:

```py
# Simple property updates
lambda: gr.Textbox(lines=4)

# Multiple component updates
lambda: [gr.Textbox(lines=4), gr.Button(interactive=False)]

# Using gr.update() for property changes
lambda: gr.update(visible=True, interactive=False)
```

We are working to increase the space of functions that can be transpiled to JavaScript so that they can be run in the browser. [Follow the Groovy library for more info](https://github.com/abidlabs/groovy-transpiler).

### Complete Example

Here's a more complete example showing how client side functions can improve the user experience:

```python
"""
This is a simple todo list app that allows you to edit tasks and mark tasks as complete.
All actions are performed on the client side.
"""
import gradio as gr

tasks = ["Get a job", "Marry rich", "", "", "", ""]
textboxes = []
buttons = []
with gr.Blocks() as demo:
    with gr.Row():
        with gr.Column(scale=3):
            gr.Markdown("# A Simple Interactive Todo List")
        with gr.Column(scale=2):
            with gr.Row():
                freeze_button = gr.Button("Freeze tasks", variant="stop")
                edit_button = gr.Button("Edit tasks")
    for i in range(6):
        with gr.Row() as r:
            t = gr.Textbox(tasks[i], placeholder="Enter a task", show_label=False, container=False, scale=7, interactive=True)
            b = gr.Button("✔️", interactive=bool(tasks[i]), variant="primary" if tasks[i] else "secondary")
            textboxes.append(t)
            buttons.append(b)
        t.change(lambda : gr.Button(interactive=True, variant="primary"), None, b, js=True)
        b.click(lambda : gr.Row(visible=False), None, r, js=True)
    freeze_button.click(lambda : [gr.Textbox(interactive=False), gr.Textbox(interactive=False), gr.Textbox(interactive=False), gr.Textbox(interactive=False), gr.Textbox(interactive=False), gr.Textbox(interactive=False)], None, textboxes, js=True)
    edit_button.click(lambda : [gr.Textbox(interactive=True), gr.Textbox(interactive=True), gr.Textbox(interactive=True), gr.Textbox(interactive=True), gr.Textbox(interactive=True), gr.Textbox(interactive=True)], None, textboxes, js=True)
    freeze_button.click(lambda : [gr.Button(visible=False), gr.Button(visible=False), gr.Button(visible=False), gr.Button(visible=False), gr.Button(visible=False), gr.Button(visible=False)], None, buttons, js=True)
    edit_button.click(lambda : [gr.Button(visible=True), gr.Button(visible=True), gr.Button(visible=True), gr.Button(visible=True), gr.Button(visible=True), gr.Button(visible=True)], None, buttons, js=True)

demo.launch()
```

### Behind the Scenes

When you set `js=True`, Gradio:

1. Transpiles your Python function to JavaScript
2. Runs the function directly in the browser
3. Still sends the request to the server (for consistency and to handle any side effects)

This provides immediate visual feedback while ensuring your application state remains consistent.

## CCS Variable Reference

[![Gradio logo](https://www.gradio.app/_app/immutable/assets/gradiodark.CbgYRzQH.svg)](https://www.gradio.app/)

This page lists all available CSS variables that can be set via the `.set()` method on a Gradio theme, organized by category. The CSS Variable column shows the variable name as used in CSS (e.g. in custom stylesheets), while the Default column shows the value set by the `Base` theme.

For more information on how to use these variables, see the [Theming Guide](https://www.gradio.app/guides/theming-guide).

#### Body Attributes

| CSS Variable                     | Description                                                                  | Default                    |
| -------------------------------- | ---------------------------------------------------------------------------- | -------------------------- |
| `--body-background-fill`         | The background of the entire app.                                            | `*background_fill_primary` |
| `--body-background-fill-dark`    | The background of the entire app in dark mode.                               | `*background_fill_primary` |
| `--body-text-color`              | The default text color.                                                      | `*neutral_800`             |
| `--body-text-color-dark`         | The default text color in dark mode.                                         | `*neutral_100`             |
| `--body-text-size`               | The default text size.                                                       | `*text_md`                 |
| `--body-text-color-subdued`      | The text color used for softer, less important text.                         | `*neutral_400`             |
| `--body-text-color-subdued-dark` | The text color used for softer, less important text in dark mode.            | `*neutral_400`             |
| `--body-text-weight`             | The default text weight.                                                     | `400`                      |
| `--embed-radius`                 | The corner radius used for embedding when the app is embedded within a page. | `*radius_sm`               |

#### Element Colors

| CSS Variable                         | Description                                                                         | Default                |
| ------------------------------------ | ----------------------------------------------------------------------------------- | ---------------------- |
| `--background-fill-primary`          | The background primarily used for items placed directly on the page.                | `white`                |
| `--background-fill-primary-dark`     | The background primarily used for items placed directly on the page in dark mode.   | `*neutral_950`         |
| `--background-fill-secondary`        | The background primarily used for items placed on top of another item.              | `*neutral_50`          |
| `--background-fill-secondary-dark`   | The background primarily used for items placed on top of another item in dark mode. | `*neutral_900`         |
| `--border-color-accent`              | The border color used for accented items.                                           | `*primary_300`         |
| `--border-color-accent-dark`         | The border color used for accented items in dark mode.                              | `*neutral_600`         |
| `--border-color-accent-subdued`      | The subdued border color for accented items.                                        | `*border_color_accent` |
| `--border-color-accent-subdued-dark` | The subdued border color for accented items in dark mode.                           | `*border_color_accent` |
| `--border-color-primary`             | The border color primarily used for items placed directly on the page.              | `*neutral_200`         |
| `--border-color-primary-dark`        | The border color primarily used for items placed directly on the page in dark mode. | `*neutral_700`         |
| `--color-accent`                     | The color used for accented items.                                                  | `*primary_500`         |
| `--color-accent-soft`                | The softer color used for accented items.                                           | `*primary_50`          |
| `--color-accent-soft-dark`           | The softer color used for accented items in dark mode.                              | `*neutral_700`         |
| `--link-text-color`                  | The text color used for links.                                                      | `*secondary_600`       |
| `--link-text-color-dark`             | The text color used for links in dark mode.                                         | `*secondary_500`       |
| `--link-text-color-active`           | The text color used for links when they are active.                                 | `*secondary_600`       |
| `--link-text-color-active-dark`      | The text color used for links when they are active in dark mode.                    | `*secondary_500`       |
| `--link-text-color-hover`            | The text color used for links when they are hovered over.                           | `*secondary_700`       |
| `--link-text-color-hover-dark`       | The text color used for links when they are hovered over in dark mode.              | `*secondary_400`       |
| `--link-text-color-visited`          | The text color used for links when they have been visited.                          | `*secondary_500`       |
| `--link-text-color-visited-dark`     | The text color used for links when they have been visited in dark mode.             | `*secondary_600`       |
| `--prose-text-size`                  | The text size used for markdown and other prose.                                    | `*text_md`             |
| `--prose-text-weight`                | The text weight used for markdown and other prose.                                  | `400`                  |
| `--prose-header-text-weight`         | The text weight of a header used for markdown and other prose.                      | `600`                  |
| `--code-background-fill`             | The background color of code blocks.                                                | `*neutral_100`         |
| `--code-background-fill-dark`        | The background color of code blocks in dark mode.                                   | `*neutral_800`         |

#### Shadows

| CSS Variable           | Description                                                | Default                                                         |
| ---------------------- | ---------------------------------------------------------- | --------------------------------------------------------------- |
| `--shadow-drop`        | Drop shadow used by other shadowed items.                  | `rgba(0,0,0,0.05) 0px 1px 2px 0px`                              |
| `--shadow-drop-lg`     | Larger drop shadow used by other shadowed items.           | `0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1)` |
| `--shadow-inset`       | Inset shadow used by other shadowed items.                 | `rgba(0,0,0,0.05) 0px 2px 4px 0px inset`                        |
| `--shadow-spread`      | Size of shadow spread used by shadowed items.              | `3px`                                                           |
| `--shadow-spread-dark` | Size of shadow spread used by shadowed items in dark mode. | `1px`                                                           |

#### Layout Atoms

| CSS Variable                         | Description                                                                                   | Default                                             |
| ------------------------------------ | --------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| `--block-background-fill`            | The background around an item.                                                                | `*background_fill_primary`                          |
| `--block-background-fill-dark`       | The background around an item in dark mode.                                                   | `*neutral_800`                                      |
| `--block-border-color`               | The border color around an item.                                                              | `*border_color_primary`                             |
| `--block-border-color-dark`          | The border color around an item in dark mode.                                                 | `*border_color_primary`                             |
| `--block-border-width`               | The border width around an item.                                                              | `1px`                                               |
| `--block-border-width-dark`          | The border width around an item in dark mode.                                                 |                                                     |
| `--block-info-text-color`            | The color of the info text.                                                                   | `*body_text_color_subdued`                          |
| `--block-info-text-color-dark`       | The color of the info text in dark mode.                                                      | `*body_text_color_subdued`                          |
| `--block-info-text-size`             | The size of the info text.                                                                    | `*text_sm`                                          |
| `--block-info-text-weight`           | The weight of the info text.                                                                  | `400`                                               |
| `--block-label-background-fill`      | The background of the title label of a media element (e.g. image).                            | `*background_fill_primary`                          |
| `--block-label-background-fill-dark` | The background of the title label of a media element (e.g. image) in dark mode.               | `*background_fill_secondary`                        |
| `--block-label-border-color`         | The border color of the title label of a media element (e.g. image).                          | `*border_color_primary`                             |
| `--block-label-border-color-dark`    | The border color of the title label of a media element (e.g. image) in dark mode.             | `*border_color_primary`                             |
| `--block-label-border-width`         | The border width of the title label of a media element (e.g. image).                          | `1px`                                               |
| `--block-label-border-width-dark`    | The border width of the title label of a media element (e.g. image) in dark mode.             |                                                     |
| `--block-label-shadow`               | The shadow of the title label of a media element (e.g. image).                                | `*block_shadow`                                     |
| `--block-label-text-color`           | The text color of the title label of a media element (e.g. image).                            | `*neutral_500`                                      |
| `--block-label-text-color-dark`      | The text color of the title label of a media element (e.g. image) in dark mode.               | `*neutral_200`                                      |
| `--block-label-margin`               | The margin of the title label of a media element (e.g. image) from its surrounding container. | `0`                                                 |
| `--block-label-padding`              | The padding of the title label of a media element (e.g. image).                               | `*spacing_sm *spacing_lg`                           |
| `--block-label-radius`               | The corner radius of the title label of a media element (e.g. image).                         | `calc(*radius_sm - 1px) 0 calc(*radius_sm - 1px) 0` |
| `--block-label-right-radius`         | The corner radius of a right-aligned helper label.                                            | `0 calc(*radius_sm - 1px) 0 calc(*radius_sm - 1px)` |
| `--block-label-text-size`            | The text size of the title label of a media element (e.g. image).                             | `*text_sm`                                          |
| `--block-label-text-weight`          | The text weight of the title label of a media element (e.g. image).                           | `400`                                               |
| `--block-padding`                    | The padding around an item.                                                                   | `*spacing_xl calc(*spacing_xl + 2px)`               |
| `--block-radius`                     | The corner radius around an item.                                                             | `*radius_sm`                                        |
| `--block-shadow`                     | The shadow under an item.                                                                     | `none`                                              |
| `--block-shadow-dark`                | The shadow under an item in dark mode.                                                        |                                                     |
| `--block-title-background-fill`      | The background of the title of a form element (e.g. textbox).                                 | `none`                                              |
| `--block-title-background-fill-dark` | The background of the title of a form element (e.g. textbox) in dark mode.                    |                                                     |
| `--block-title-border-color`         | The border color of the title of a form element (e.g. textbox).                               | `none`                                              |
| `--block-title-border-color-dark`    | The border color of the title of a form element (e.g. textbox) in dark mode.                  |                                                     |
| `--block-title-border-width`         | The border width of the title of a form element (e.g. textbox).                               | `0px`                                               |
| `--block-title-border-width-dark`    | The border width of the title of a form element (e.g. textbox) in dark mode.                  |                                                     |
| `--block-title-text-color`           | The text color of the title of a form element (e.g. textbox).                                 | `*neutral_500`                                      |
| `--block-title-text-color-dark`      | The text color of the title of a form element (e.g. textbox) in dark mode.                    | `*neutral_200`                                      |
| `--block-title-padding`              | The padding of the title of a form element (e.g. textbox).                                    | `0`                                                 |
| `--block-title-radius`               | The corner radius of the title of a form element (e.g. textbox).                              | `none`                                              |
| `--block-title-text-size`            | The text size of the title of a form element (e.g. textbox).                                  | `*text_md`                                          |
| `--block-title-text-weight`          | The text weight of the title of a form element (e.g. textbox).                                | `400`                                               |
| `--container-radius`                 | The corner radius of a layout component that holds other content.                             | `*radius_sm`                                        |
| `--form-gap-width`                   | The border gap between form elements, (e.g. consecutive textboxes).                           | `0px`                                               |
| `--layout-gap`                       | The gap between items within a row or column.                                                 | `*spacing_xxl`                                      |
| `--panel-background-fill`            | The background of a panel.                                                                    | `*background_fill_secondary`                        |
| `--panel-background-fill-dark`       | The background of a panel in dark mode.                                                       | `*background_fill_secondary`                        |
| `--panel-border-color`               | The border color of a panel.                                                                  | `*border_color_primary`                             |
| `--panel-border-color-dark`          | The border color of a panel in dark mode.                                                     | `*border_color_primary`                             |
| `--panel-border-width`               | The border width of a panel.                                                                  | `0`                                                 |
| `--panel-border-width-dark`          | The border width of a panel in dark mode.                                                     |                                                     |
| `--section-header-text-size`         | The text size of a section header (e.g. tab name).                                            | `*text_md`                                          |
| `--section-header-text-weight`       | The text weight of a section header (e.g. tab name).                                          | `400`                                               |

#### Component Atoms

| CSS Variable                                     | Description                                                                                               | Default                                                                                                                                                                                                                                                |
| ------------------------------------------------ | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `--accordion-text-color`                         | The body text color in the accordion.                                                                     | `*body_text_color`                                                                                                                                                                                                                                     |
| `--accordion-text-color-dark`                    | The body text color in the accordion in dark mode.                                                        | `*body_text_color`                                                                                                                                                                                                                                     |
| `--table-text-color`                             | The body text color in the table.                                                                         | `*body_text_color`                                                                                                                                                                                                                                     |
| `--table-text-color-dark`                        | The body text color in the table in dark mode.                                                            | `*body_text_color`                                                                                                                                                                                                                                     |
| `--checkbox-background-color`                    | The background of a checkbox square or radio circle.                                                      | `*background_fill_primary`                                                                                                                                                                                                                             |
| `--chatbot-text-size`                            | The text size of the chatbot text.                                                                        | `*text_lg`                                                                                                                                                                                                                                             |
| `--checkbox-background-color-dark`               | The background of a checkbox square or radio circle in dark mode.                                         | `*neutral_800`                                                                                                                                                                                                                                         |
| `--checkbox-background-color-focus`              | The background of a checkbox square or radio circle when focused.                                         | `*checkbox_background_color`                                                                                                                                                                                                                           |
| `--checkbox-background-color-focus-dark`         | The background of a checkbox square or radio circle when focused in dark mode.                            | `*checkbox_background_color`                                                                                                                                                                                                                           |
| `--checkbox-background-color-hover`              | The background of a checkbox square or radio circle when hovered over.                                    | `*checkbox_background_color`                                                                                                                                                                                                                           |
| `--checkbox-background-color-hover-dark`         | The background of a checkbox square or radio circle when hovered over in dark mode.                       | `*checkbox_background_color`                                                                                                                                                                                                                           |
| `--checkbox-background-color-selected`           | The background of a checkbox square or radio circle when selected.                                        | `*color_accent`                                                                                                                                                                                                                                        |
| `--checkbox-background-color-selected-dark`      | The background of a checkbox square or radio circle when selected in dark mode.                           | `*color_accent`                                                                                                                                                                                                                                        |
| `--checkbox-border-color`                        | The border color of a checkbox square or radio circle.                                                    | `*neutral_300`                                                                                                                                                                                                                                         |
| `--checkbox-border-color-dark`                   | The border color of a checkbox square or radio circle in dark mode.                                       | `*neutral_700`                                                                                                                                                                                                                                         |
| `--checkbox-border-color-focus`                  | The border color of a checkbox square or radio circle when focused.                                       | `*color_accent`                                                                                                                                                                                                                                        |
| `--checkbox-border-color-focus-dark`             | The border color of a checkbox square or radio circle when focused in dark mode.                          | `*color_accent`                                                                                                                                                                                                                                        |
| `--checkbox-border-color-hover`                  | The border color of a checkbox square or radio circle when hovered over.                                  | `*neutral_300`                                                                                                                                                                                                                                         |
| `--checkbox-border-color-hover-dark`             | The border color of a checkbox square or radio circle when hovered over in dark mode.                     | `*neutral_600`                                                                                                                                                                                                                                         |
| `--checkbox-border-color-selected`               | The border color of a checkbox square or radio circle when selected.                                      | `*color_accent`                                                                                                                                                                                                                                        |
| `--checkbox-border-color-selected-dark`          | The border color of a checkbox square or radio circle when selected in dark mode.                         | `*color_accent`                                                                                                                                                                                                                                        |
| `--checkbox-border-radius`                       | The corner radius of a checkbox square.                                                                   | `*radius_sm`                                                                                                                                                                                                                                           |
| `--checkbox-border-width`                        | The border width of a checkbox square or radio circle.                                                    | `*input_border_width`                                                                                                                                                                                                                                  |
| `--checkbox-border-width-dark`                   | The border width of a checkbox square or radio circle in dark mode.                                       | `*input_border_width`                                                                                                                                                                                                                                  |
| `--checkbox-check`                               | The checkmark visual of a checkbox square.                                                                | `url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='white' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='M12.207 4.793a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0l-2-2a1 1 0 011.414-1.414L6.5 9.086l4.293-4.293a1 1 0 011.414 0z'/%3e%3c/svg%3e")` |
| `--radio-circle`                                 | The circle visual of a radio circle.                                                                      | `url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='white' xmlns='http://www.w3.org/2000/svg'%3e%3ccircle cx='8' cy='8' r='3'/%3e%3c/svg%3e")`                                                                                                   |
| `--checkbox-shadow`                              | The shadow of a checkbox square or radio circle.                                                          | `*input_shadow`                                                                                                                                                                                                                                        |
| `--checkbox-label-background-fill`               | The background of the surrounding button of a checkbox or radio element.                                  | `*button_secondary_background_fill`                                                                                                                                                                                                                    |
| `--checkbox-label-background-fill-dark`          | The background of the surrounding button of a checkbox or radio element in dark mode.                     | `*button_secondary_background_fill`                                                                                                                                                                                                                    |
| `--checkbox-label-background-fill-hover`         | The background of the surrounding button of a checkbox or radio element when hovered over.                | `*button_secondary_background_fill_hover`                                                                                                                                                                                                              |
| `--checkbox-label-background-fill-hover-dark`    | The background of the surrounding button of a checkbox or radio element when hovered over in dark mode.   | `*button_secondary_background_fill_hover`                                                                                                                                                                                                              |
| `--checkbox-label-background-fill-selected`      | The background of the surrounding button of a checkbox or radio element when selected.                    | `*checkbox_label_background_fill`                                                                                                                                                                                                                      |
| `--checkbox-label-background-fill-selected-dark` | The background of the surrounding button of a checkbox or radio element when selected in dark mode.       | `*checkbox_label_background_fill`                                                                                                                                                                                                                      |
| `--checkbox-label-border-color`                  | The border color of the surrounding button of a checkbox or radio element.                                | `*border_color_primary`                                                                                                                                                                                                                                |
| `--checkbox-label-border-color-dark`             | The border color of the surrounding button of a checkbox or radio element in dark mode.                   | `*border_color_primary`                                                                                                                                                                                                                                |
| `--checkbox-label-border-color-hover`            | The border color of the surrounding button of a checkbox or radio element when hovered over.              | `*checkbox_label_border_color`                                                                                                                                                                                                                         |
| `--checkbox-label-border-color-hover-dark`       | The border color of the surrounding button of a checkbox or radio element when hovered over in dark mode. | `*checkbox_label_border_color`                                                                                                                                                                                                                         |
| `--checkbox-label-border-color-selected`         | The border color of the surrounding button of a checkbox or radio element when selected.                  | `*checkbox_label_border_color`                                                                                                                                                                                                                         |
| `--checkbox-label-border-color-selected-dark`    | The border color of the surrounding button of a checkbox or radio element when selected in dark mode.     | `*checkbox_label_border_color`                                                                                                                                                                                                                         |
| `--checkbox-label-border-width`                  | The border width of the surrounding button of a checkbox or radio element.                                | `*input_border_width`                                                                                                                                                                                                                                  |
| `--checkbox-label-border-width-dark`             | The border width of the surrounding button of a checkbox or radio element in dark mode.                   | `*input_border_width`                                                                                                                                                                                                                                  |
| `--checkbox-label-gap`                           | The gap consecutive checkbox or radio elements.                                                           | `*spacing_lg`                                                                                                                                                                                                                                          |
| `--checkbox-label-padding`                       | The padding of the surrounding button of a checkbox or radio element.                                     | `*spacing_md calc(2 * *spacing_md)`                                                                                                                                                                                                                    |
| `--checkbox-label-shadow`                        | The shadow of the surrounding button of a checkbox or radio element.                                      | `none`                                                                                                                                                                                                                                                 |
| `--checkbox-label-shadow-dark`                   | The shadow of the surrounding button of a checkbox or radio element in dark mode.                         |                                                                                                                                                                                                                                                        |
| `--checkbox-label-shadow-hover`                  | The shadow of the surrounding button of a checkbox or radio element on hover.                             | `*checkbox_label_shadow`                                                                                                                                                                                                                               |
| `--checkbox-label-shadow-hover-dark`             |                                                                                                           |                                                                                                                                                                                                                                                        |
| `--checkbox-label-shadow-active`                 | The shadow of the surrounding button of a checkbox or radio element when active.                          | `*checkbox_label_shadow`                                                                                                                                                                                                                               |
| `--checkbox-label-shadow-active-dark`            |                                                                                                           |                                                                                                                                                                                                                                                        |
| `--checkbox-label-text-size`                     | The text size of the label accompanying a checkbox or radio element.                                      | `*text_md`                                                                                                                                                                                                                                             |
| `--checkbox-label-text-weight`                   | The text weight of the label accompanying a checkbox or radio element.                                    | `400`                                                                                                                                                                                                                                                  |
| `--checkbox-label-text-color`                    | The text color of the label accompanying a checkbox or radio element.                                     | `*body_text_color`                                                                                                                                                                                                                                     |
| `--checkbox-label-text-color-dark`               | The text color of the label accompanying a checkbox or radio element in dark mode.                        | `*body_text_color`                                                                                                                                                                                                                                     |
| `--checkbox-label-text-color-selected`           | The text color of the label accompanying a checkbox or radio element when selected.                       | `*checkbox_label_text_color`                                                                                                                                                                                                                           |
| `--checkbox-label-text-color-selected-dark`      | The text color of the label accompanying a checkbox or radio element when selected in dark mode.          | `*checkbox_label_text_color`                                                                                                                                                                                                                           |
| `--error-background-fill`                        | The background of an error message.                                                                       | `#fef2f2`                                                                                                                                                                                                                                              |
| `--error-background-fill-dark`                   | The background of an error message in dark mode.                                                          | `*background_fill_primary`                                                                                                                                                                                                                             |
| `--error-border-color`                           | The border color of an error message.                                                                     | `#b91c1c`                                                                                                                                                                                                                                              |
| `--error-border-color-dark`                      | The border color of an error message in dark mode.                                                        | `#ef4444`                                                                                                                                                                                                                                              |
| `--error-border-width`                           | The border width of an error message.                                                                     | `1px`                                                                                                                                                                                                                                                  |
| `--error-border-width-dark`                      | The border width of an error message in dark mode.                                                        |                                                                                                                                                                                                                                                        |
| `--error-text-color`                             | The text color of an error message.                                                                       | `#b91c1c`                                                                                                                                                                                                                                              |
| `--error-text-color-dark`                        | The text color of an error message in dark mode.                                                          | `#fef2f2`                                                                                                                                                                                                                                              |
| `--error-icon-color`                             |                                                                                                           | `#b91c1c`                                                                                                                                                                                                                                              |
| `--error-icon-color-dark`                        |                                                                                                           | `#ef4444`                                                                                                                                                                                                                                              |
| `--input-background-fill`                        | The background of an input field.                                                                         | `*neutral_100`                                                                                                                                                                                                                                         |
| `--input-background-fill-dark`                   | The background of an input field in dark mode.                                                            | `*neutral_700`                                                                                                                                                                                                                                         |
| `--input-background-fill-focus`                  | The background of an input field when focused.                                                            | `*input_background_fill`                                                                                                                                                                                                                               |
| `--input-background-fill-focus-dark`             | The background of an input field when focused in dark mode.                                               |                                                                                                                                                                                                                                                        |
| `--input-background-fill-hover`                  | The background of an input field when hovered over.                                                       | `*input_background_fill`                                                                                                                                                                                                                               |
| `--input-background-fill-hover-dark`             | The background of an input field when hovered over in dark mode.                                          | `*input_background_fill`                                                                                                                                                                                                                               |
| `--input-border-color`                           | The border color of an input field.                                                                       | `*border_color_primary`                                                                                                                                                                                                                                |
| `--input-border-color-dark`                      | The border color of an input field in dark mode.                                                          | `*border_color_primary`                                                                                                                                                                                                                                |
| `--input-border-color-focus`                     | The border color of an input field when focused.                                                          | `*secondary_300`                                                                                                                                                                                                                                       |
| `--input-border-color-focus-dark`                | The border color of an input field when focused in dark mode.                                             | `*neutral_700`                                                                                                                                                                                                                                         |
| `--input-border-color-hover`                     | The border color of an input field when hovered over.                                                     | `*input_border_color`                                                                                                                                                                                                                                  |
| `--input-border-color-hover-dark`                | The border color of an input field when hovered over in dark mode.                                        | `*input_border_color`                                                                                                                                                                                                                                  |
| `--input-border-width`                           | The border width of an input field.                                                                       | `0px`                                                                                                                                                                                                                                                  |
| `--input-border-width-dark`                      | The border width of an input field in dark mode.                                                          |                                                                                                                                                                                                                                                        |
| `--input-padding`                                | The padding of an input field.                                                                            | `*spacing_xl`                                                                                                                                                                                                                                          |
| `--input-placeholder-color`                      | The placeholder text color of an input field.                                                             | `*neutral_400`                                                                                                                                                                                                                                         |
| `--input-placeholder-color-dark`                 | The placeholder text color of an input field in dark mode.                                                | `*neutral_500`                                                                                                                                                                                                                                         |
| `--input-radius`                                 | The corner radius of an input field.                                                                      | `*radius_sm`                                                                                                                                                                                                                                           |
| `--input-shadow`                                 | The shadow of an input field.                                                                             | `none`                                                                                                                                                                                                                                                 |
| `--input-shadow-dark`                            | The shadow of an input field in dark mode.                                                                |                                                                                                                                                                                                                                                        |
| `--input-shadow-focus`                           | The shadow of an input field when focused.                                                                | `*input_shadow`                                                                                                                                                                                                                                        |
| `--input-shadow-focus-dark`                      | The shadow of an input field when focused in dark mode.                                                   |                                                                                                                                                                                                                                                        |
| `--input-text-size`                              | The text size of an input field.                                                                          | `*text_md`                                                                                                                                                                                                                                             |
| `--input-text-weight`                            | The text weight of an input field.                                                                        | `400`                                                                                                                                                                                                                                                  |
| `--loader-color`                                 | The color of the loading animation while a request is pending.                                            | `*color_accent`                                                                                                                                                                                                                                        |
| `--loader-color-dark`                            | The color of the loading animation while a request is pending in dark mode.                               |                                                                                                                                                                                                                                                        |
| `--slider-color`                                 | The color of the slider in a range element.                                                               | `*color_accent`                                                                                                                                                                                                                                        |
| `--slider-color-dark`                            | The color of the slider in a range element in dark mode.                                                  |                                                                                                                                                                                                                                                        |
| `--stat-background-fill`                         | The background used for stats visuals (e.g. confidence bars in label).                                    | `*primary_300`                                                                                                                                                                                                                                         |
| `--stat-background-fill-dark`                    | The background used for stats visuals (e.g. confidence bars in label) in dark mode.                       | `*primary_500`                                                                                                                                                                                                                                         |
| `--table-border-color`                           | The border color of a table.                                                                              | `*neutral_300`                                                                                                                                                                                                                                         |
| `--table-border-color-dark`                      | The border color of a table in dark mode.                                                                 | `*neutral_700`                                                                                                                                                                                                                                         |
| `--table-even-background-fill`                   | The background of even rows in a table.                                                                   | `white`                                                                                                                                                                                                                                                |
| `--table-even-background-fill-dark`              | The background of even rows in a table in dark mode.                                                      | `*neutral_950`                                                                                                                                                                                                                                         |
| `--table-odd-background-fill`                    | The background of odd rows in a table.                                                                    | `*neutral_50`                                                                                                                                                                                                                                          |
| `--table-odd-background-fill-dark`               | The background of odd rows in a table in dark mode.                                                       | `*neutral_900`                                                                                                                                                                                                                                         |
| `--table-radius`                                 | The corner radius of a table.                                                                             | `*radius_sm`                                                                                                                                                                                                                                           |
| `--table-row-focus`                              | The background of a focused row in a table.                                                               | `*color_accent_soft`                                                                                                                                                                                                                                   |
| `--table-row-focus-dark`                         | The background of a focused row in a table in dark mode.                                                  | `*color_accent_soft`                                                                                                                                                                                                                                   |

#### Buttons

| CSS Variable                                    | Description                                                                                 | Default                                   |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------- |
| `--button-border-width`                         | The border width of a button.                                                               | `*input_border_width`                     |
| `--button-border-width-dark`                    | The border width of a button in dark mode.                                                  |                                           |
| `--button-transform-hover`                      | The transform animation of a button on hover.                                               | `none`                                    |
| `--button-transform-active`                     | The transform animation of a button when pressed.                                           | `none`                                    |
| `--button-transition`                           | The transition animation duration of a button between regular, hover, and focused states.   | `all 0.2s ease`                           |
| `--button-large-padding`                        | The padding of a button with the default "large" size.                                      | `*spacing_lg calc(2 * *spacing_lg)`       |
| `--button-large-radius`                         | The corner radius of a button with the default "large" size.                                | `*radius_md`                              |
| `--button-large-text-size`                      | The text size of a button with the default "large" size.                                    | `*text_lg`                                |
| `--button-large-text-weight`                    | The text weight of a button with the default "large" size.                                  | `600`                                     |
| `--button-small-padding`                        | The padding of a button set to "small" size.                                                | `*spacing_sm calc(1.5 * *spacing_sm)`     |
| `--button-small-radius`                         | The corner radius of a button set to "small" size.                                          | `*radius_md`                              |
| `--button-small-text-size`                      | The text size of a button set to "small" size.                                              | `*text_sm`                                |
| `--button-small-text-weight`                    | The text weight of a button set to "small" size.                                            | `400`                                     |
| `--button-medium-padding`                       | The padding of a button set to "medium" size.                                               | `*spacing_md calc(2 * *spacing_md)`       |
| `--button-medium-radius`                        | The corner radius of a button set to "medium" size.                                         | `*radius_md`                              |
| `--button-medium-text-size`                     | The text size of a button set to "medium" size.                                             | `*text_md`                                |
| `--button-medium-text-weight`                   | The text weight of a button set to "medium" size.                                           | `600`                                     |
| `--button-primary-background-fill`              | The background of a button of "primary" variant.                                            | `*primary_500`                            |
| `--button-primary-background-fill-dark`         | The background of a button of "primary" variant in dark mode.                               | `*primary_600`                            |
| `--button-primary-background-fill-hover`        | The background of a button of "primary" variant when hovered over.                          | `*primary_600`                            |
| `--button-primary-background-fill-hover-dark`   | The background of a button of "primary" variant when hovered over in dark mode.             | `*primary_700`                            |
| `--button-primary-border-color`                 | The border color of a button of "primary" variant.                                          | `*primary_500`                            |
| `--button-primary-border-color-dark`            | The border color of a button of "primary" variant in dark mode.                             | `*primary_600`                            |
| `--button-primary-border-color-hover`           | The border color of a button of "primary" variant when hovered over.                        | `*primary_500`                            |
| `--button-primary-border-color-hover-dark`      | The border color of a button of "primary" variant when hovered over in dark mode.           | `*primary_500`                            |
| `--button-primary-text-color`                   | The text color of a button of "primary" variant.                                            | `white`                                   |
| `--button-primary-text-color-dark`              | The text color of a button of "primary" variant in dark mode.                               | `white`                                   |
| `--button-primary-text-color-hover`             | The text color of a button of "primary" variant when hovered over.                          | `*button_primary_text_color`              |
| `--button-primary-text-color-hover-dark`        | The text color of a button of "primary" variant when hovered over in dark mode.             | `*button_primary_text_color`              |
| `--button-primary-shadow`                       | The shadow under a primary button.                                                          | `none`                                    |
| `--button-primary-shadow-hover`                 | The shadow under a primary button when hovered over.                                        | `*button_primary_shadow`                  |
| `--button-primary-shadow-active`                | The shadow under a primary button when pressed.                                             | `*button_primary_shadow`                  |
| `--button-primary-shadow-dark`                  | The shadow under a primary button in dark mode.                                             |                                           |
| `--button-primary-shadow-hover-dark`            | The shadow under a primary button when hovered over in dark mode.                           | `*button_primary_shadow`                  |
| `--button-primary-shadow-active-dark`           | The shadow under a primary button when pressed in dark mode.                                | `*button_primary_shadow`                  |
| `--button-secondary-background-fill`            | The background of a button of default "secondary" variant.                                  | `*neutral_200`                            |
| `--button-secondary-background-fill-dark`       | The background of a button of default "secondary" variant in dark mode.                     | `*neutral_600`                            |
| `--button-secondary-background-fill-hover`      | The background of a button of default "secondary" variant when hovered over.                | `*neutral_300`                            |
| `--button-secondary-background-fill-hover-dark` | The background of a button of default "secondary" variant when hovered over in dark mode.   | `*neutral_700`                            |
| `--button-secondary-border-color`               | The border color of a button of default "secondary" variant.                                | `*neutral_200`                            |
| `--button-secondary-border-color-dark`          | The border color of a button of default "secondary" variant in dark mode.                   | `*neutral_600`                            |
| `--button-secondary-border-color-hover`         | The border color of a button of default "secondary" variant when hovered over.              | `*neutral_200`                            |
| `--button-secondary-border-color-hover-dark`    | The border color of a button of default "secondary" variant when hovered over in dark mode. | `*neutral_500`                            |
| `--button-secondary-text-color`                 | The text color of a button of default "secondary" variant.                                  | `black`                                   |
| `--button-secondary-text-color-dark`            | The text color of a button of default "secondary" variant in dark mode.                     | `white`                                   |
| `--button-secondary-text-color-hover`           | The text color of a button of default "secondary" variant when hovered over.                | `*button_secondary_text_color`            |
| `--button-secondary-text-color-hover-dark`      | The text color of a button of default "secondary" variant when hovered over in dark mode.   | `*button_secondary_text_color`            |
| `--button-secondary-shadow`                     | The shadow under a secondary button.                                                        | `*button_primary_shadow`                  |
| `--button-secondary-shadow-hover`               | The shadow under a secondary button when hovered over.                                      | `*button_secondary_shadow`                |
| `--button-secondary-shadow-active`              | The shadow under a secondary button when pressed.                                           | `*button_secondary_shadow`                |
| `--button-secondary-shadow-dark`                | The shadow under a secondary button in dark mode.                                           |                                           |
| `--button-secondary-shadow-hover-dark`          | The shadow under a secondary button when hovered over in dark mode.                         | `*button_secondary_shadow`                |
| `--button-secondary-shadow-active-dark`         | The shadow under a secondary button when pressed in dark mode.                              | `*button_secondary_shadow`                |
| `--button-cancel-background-fill`               | The background of a button of "cancel" variant.                                             | `*button_secondary_background_fill`       |
| `--button-cancel-background-fill-dark`          | The background of a button of "cancel" variant in dark mode.                                | `*button_secondary_background_fill`       |
| `--button-cancel-background-fill-hover`         | The background of a button of "cancel" variant when hovered over.                           | `*button_secondary_background_fill_hover` |
| `--button-cancel-background-fill-hover-dark`    | The background of a button of "cancel" variant when hovered over in dark mode.              | `*button_secondary_background_fill_hover` |
| `--button-cancel-border-color`                  | The border color of a button of "cancel" variant.                                           | `*button_secondary_border_color`          |
| `--button-cancel-border-color-dark`             | The border color of a button of "cancel" variant in dark mode.                              | `*button_secondary_border_color`          |
| `--button-cancel-border-color-hover`            | The border color of a button of "cancel" variant when hovered over.                         | `*button_secondary_border_color_hover`    |
| `--button-cancel-border-color-hover-dark`       | The border color of a button of "cancel" variant when hovered over in dark mode.            | `*button_secondary_border_color_hover`    |
| `--button-cancel-text-color`                    | The text color of a button of "cancel" variant.                                             | `*button_secondary_text_color`            |
| `--button-cancel-text-color-dark`               | The text color of a button of "cancel" variant in dark mode.                                | `*button_secondary_text_color`            |
| `--button-cancel-text-color-hover`              | The text color of a button of "cancel" variant when hovered over.                           | `*button_secondary_text_color_hover`      |
| `--button-cancel-text-color-hover-dark`         | The text color of a button of "cancel" variant when hovered over in dark mode.              | `white`                                   |
| `--button-cancel-shadow`                        | The shadow under a button of "cancel" variant.                                              | `*button_secondary_shadow`                |
| `--button-cancel-shadow-hover`                  | The shadow under a button of "cancel" variant when hovered over.                            | `*button_secondary_shadow_hover`          |
| `--button-cancel-shadow-active`                 | The shadow under a button of "cancel" variant when pressed.                                 | `*button_secondary_shadow_active`         |
| `--button-cancel-shadow-dark`                   | The shadow under a button of "cancel" variant in dark mode.                                 | `*button_secondary_shadow`                |
| `--button-cancel-shadow-hover-dark`             | The shadow under a button of "cancel" variant when hovered over in dark mode.               | `*button_secondary_shadow_hover`          |
| `--button-cancel-shadow-active-dark`            | The shadow under a button of "cancel" variant when pressed in dark mode.                    | `*button_secondary_shadow_active`         |

## Queing

[![Gradio logo](https://www.gradio.app/_app/immutable/assets/gradiodark.CbgYRzQH.svg)](https://www.gradio.app/)

Every Gradio app comes with a built-in queuing system that can scale to thousands of concurrent users. Because many of your event listeners may involve heavy processing, Gradio automatically creates a queue to handle every event listener in the backend. Every event listener in your app automatically has a queue to process incoming events.

### Configuring the Queue

By default, each event listener has its own queue, which handles one request at a time. This can be configured via two arguments:

- `concurrency_limit`: This sets the maximum number of concurrent executions for an event listener. By default, the limit is 1 unless configured otherwise in `Blocks.queue()`. You can also set it to `None` for no limit (i.e., an unlimited number of concurrent executions). For example:

```python
import gradio as gr

with gr.Blocks() as demo:
    prompt = gr.Textbox()
    image = gr.Image()
    generate_btn = gr.Button("Generate Image")
    generate_btn.click(image_gen, prompt, image, concurrency_limit=5)
```

In the code above, up to 5 requests can be processed simultaneously for this event listener. Additional requests will be queued until a slot becomes available.

If you want to manage multiple event listeners using a shared queue, you can use the `concurrency_id` argument:

- `concurrency_id`: This allows event listeners to share a queue by assigning them the same ID. For example, if your setup has only 2 GPUs but multiple functions require GPU access, you can create a shared queue for all those functions. Here's how that might look:

```python
import gradio as gr

with gr.Blocks() as demo:
    prompt = gr.Textbox()
    image = gr.Image()
    generate_btn_1 = gr.Button("Generate Image via model 1")
    generate_btn_2 = gr.Button("Generate Image via model 2")
    generate_btn_3 = gr.Button("Generate Image via model 3")
    generate_btn_1.click(image_gen_1, prompt, image, concurrency_limit=2, concurrency_id="gpu_queue")
    generate_btn_2.click(image_gen_2, prompt, image, concurrency_id="gpu_queue")
    generate_btn_3.click(image_gen_3, prompt, image, concurrency_id="gpu_queue")
```

In this example, all three event listeners share a queue identified by `"gpu_queue"`. The queue can handle up to 2 concurrent requests at a time, as defined by the `concurrency_limit`.

### Notes

- To ensure unlimited concurrency for an event listener, set `concurrency_limit=None`. This is useful if your function is calling e.g. an external API which handles the rate limiting of requests itself.
- The default concurrency limit for all queues can be set globally using the `default_concurrency_limit` parameter in `Blocks.queue()`.

These configurations make it easy to manage the queuing behavior of your Gradio app.

## Progress Bars

[![Gradio logo](https://www.gradio.app/_app/immutable/assets/gradiodark.CbgYRzQH.svg)](https://www.gradio.app/)

Gradio supports the ability to create custom Progress Bars so that you have customizability and control over the progress update that you show to the user. In order to enable this, simply add an argument to your method that has a default value of a `gr.Progress` instance. Then you can update the progress levels by calling this instance directly with a float between 0 and 1, or using the `tqdm()` method of the `Progress` instance to track progress over an iterable, as shown below.

```python
import gradio as gr
import time

def slowly_reverse(word, progress=gr.Progress()):
    progress(0, desc="Starting")
    time.sleep(1)
    progress(0.05)
    new_string = ""
    for letter in progress.tqdm(word, desc="Reversing"):
        time.sleep(0.25)
        new_string = letter + new_string
    return new_string

demo = gr.Interface(slowly_reverse, gr.Text(), gr.Text(), api_name="predict")

demo.launch()
```

[gradio/progress_simple](https://huggingface.co/spaces/gradio/progress_simple) built with [Gradio](https://gradio.app/). Hosted on [Spaces](https://huggingface.co/spaces)

If you use the `tqdm` library, you can even report progress updates automatically from any `tqdm.tqdm` that already exists within your function by setting the default argument as `gr.Progress(track_tqdm=True)`!

## MultiPage Apps

[![Gradio logo](https://www.gradio.app/_app/immutable/assets/gradiodark.CbgYRzQH.svg)](https://www.gradio.app/)

Your Gradio app can support multiple pages with the `Blocks.route()` method. Here's what a multipage Gradio app generally looks like:

```python
with gr.Blocks() as demo:  # Main page
    name = gr.Textbox(label="Name")
    ...
with demo.route("Second page", "/second"):
    num = gr.Number()
    ...

demo.launch()
```

This allows you to define links to separate pages, each with a separate URL, which are linked to the top of the Gradio app in an automatically-generated navbar.

Here's a complete example:

```python
import gradio as gr
import random
import time

with gr.Blocks() as demo:
    name = gr.Textbox(label="Name")
    output = gr.Textbox(label="Output Box")
    greet_btn = gr.Button("Greet")
    @gr.on([greet_btn.click, name.submit], inputs=name, outputs=output)
    def greet(name):
        return "Hello " + name + "!"

    @gr.render(inputs=name, triggers=[output.change])
    def spell_out(name):
        with gr.Row():
            for letter in name:
                gr.Textbox(letter)

with demo.route("Up") as incrementer_demo:
    num = gr.Number()
    incrementer_demo.load(lambda: time.sleep(1) or random.randint(10, 40), None, num)

    with gr.Row():
        inc_btn = gr.Button("Increase")
        dec_btn = gr.Button("Decrease")
    inc_btn.click(fn=lambda x: x + 1, inputs=num, outputs=num, api_name="increment")
    dec_btn.click(fn=lambda x: x - 1, inputs=num, outputs=num, api_name="decrement")
    for i in range(100):
        gr.Textbox()

def wait(x):
    time.sleep(2)
    return x

identity_iface = gr.Interface(wait, "image", "image", api_name="predict")

with demo.route("Interface") as incrementer_demo:
    identity_iface.render()
    gr.Interface(lambda x, y: x * y, ["number", "number"], "number", api_name="predict")

demo.launch()
```

All of these pages will share the same backend, including the same queue.

Note: multipage apps do not support interactions between pages, e.g. an event listener on one page cannot output to a component on another page. Use `gr.Tabs()` for this type of functionality instead of pages.

**Separate Files**

For maintainability, you may want to write the code for different pages in different files. Because any Gradio Blocks can be imported and rendered inside another Blocks using the `.render()` method, you can do this as follows.

Create one main file, say `app.py` and create separate Python files for each page:

```null
- app.py
- main_page.py
- second_page.py
```

The Python file corresponding to each page should consist of a regular Gradio Blocks, Interface, or ChatInterface application, e.g.

`main_page.py`

```py
import gradio as gr

with gr.Blocks() as demo:
    gr.Image()

if __name__ == "__main__":
    demo.launch()
```

`second_page.py`

```py
import gradio as gr

with gr.Blocks() as demo:
    t = gr.Textbox()
    demo.load(lambda : "Loaded", None, t)

if __name__ == "__main__":
    demo.launch()
```

In your main `app.py` file, simply import the Gradio demos from the page files and `.render()` them:

`app.py`

```py
import gradio as gr

import main_page, second_page

with gr.Blocks() as demo:
    main_page.demo.render()
with demo.route("Second Page"):
    second_page.demo.render()

if __name__ == "__main__":
    demo.launch()
```

This allows you to run each page as an independent Gradio app for testing, while also creating a single file `app.py` that serves as the entrypoint for the complete multipage app.

### Customizing the Navbar

By default, Gradio automatically generates a navigation bar for multipage apps that displays all your pages with "Home" as the title for the main page. You can customize the navbar behavior using the `gr.Navbar` component.

### Per-Page Navbar Configuration

You can have different navbar configurations for each page of your app:

```python
import gradio as gr

with gr.Blocks() as demo:
    # Navbar for the main page
    navbar = gr.Navbar(
        visible=True,
        main_page_name="Dashboard",
        value=[("About", "https://example.com/about")]
    )

    gr.Textbox(label="Main page content")

with demo.route("Settings"):
    # Different navbar for the Settings page
    navbar = gr.Navbar(
        visible=True,
        main_page_name="Home",
        value=[("Documentation", "https://docs.example.com")]
    )
    gr.Textbox(label="Settings page")

demo.launch()
```

**Important Notes:**

- You can have one `gr.Navbar` component per page. Each page's navbar configuration is independent.
- The `main_page_name` parameter customizes the title of the home page link in the navbar.
- The `value` parameter allows you to add additional links to the navbar, which can be internal pages or external URLs.
- If no `gr.Navbar` component is present on a page, the default navbar behavior is used (visible with "Home" as the home page title).
- You can update the navbar properties using standard Gradio event handling, just like with any other component.

Here's an example that demonstrates the last point:

```python
import gradio as gr

with gr.Blocks(title="Navbar Demo") as demo:
    navbar = gr.Navbar(value=[("About Me", "https://x.com/abidlabs")], visible=True, main_page_name="Dashboard")
    gr.Markdown("# Dashboard Page")
    hide_btn = gr.Button("Hide Navbar")
    hide_btn.click(fn=lambda : gr.Navbar(visible=False), outputs=navbar)
    show_btn = gr.Button("Show Navbar")
    show_btn.click(fn=lambda : gr.Navbar(visible=True, main_page_name="Dashboard is Back!"), outputs=navbar)

with demo.route("Settings", "/settings"):
    gr.Markdown("# Settings Page")

demo.launch()
```

[![Gradio logo](https://www.gradio.app/_app/immutable/assets/gradiodark.CbgYRzQH.svg)](https://www.gradio.app/)

## Build a Custom Multimodal Chatbot - Part 1

This is the first in a two part series where we build a custom Multimodal Chatbot component. In part 1, we will modify the Gradio Chatbot component to display text and media files (video, audio, image) in the same message. In part 2, we will build a custom Textbox component that will be able to send multimodal messages (text and media files) to the chatbot.

You can follow along with the author of this post as he implements the chatbot component in the following YouTube video!

![](https://www.youtube.com/watch?v=IVJkOHTBPn0)

Here's a preview of what our multimodal chatbot component will look like:

### Part 1 - Creating our project

For this demo we will be tweaking the existing Gradio `Chatbot` component to display text and media files in the same message. Let's create a new custom component directory by templating off of the `Chatbot` component source code.

```bash
gradio cc create MultimodalChatbot --template Chatbot
```

And we're ready to go!

Make sure to modify the `Author` key in the `pyproject.toml` file.

### Part 2a - The backend data_model

Open up the `multimodalchatbot.py` file in your favorite code editor and let's get started modifying the backend of our component.

The first thing we will do is create the `data_model` of our component. The `data_model` is the data format that your python component will receive and send to the javascript client running the UI. You can read more about the `data_model` in the [backend guide](https://www.gradio.app/guides/backend).

For our component, each chatbot message will consist of two keys: a `text` key that displays the text message and an optional list of media files that can be displayed underneath the text.

Import the `FileData` and `GradioModel` classes from `gradio.data_classes` and modify the existing `ChatbotData` class to look like the following:

```python
class FileMessage(GradioModel):
    file: FileData
    alt_text: Optional[str] = None

class MultimodalMessage(GradioModel):
    text: Optional[str] = None
    files: Optional[List[FileMessage]] = None

class ChatbotData(GradioRootModel):
    root: List[Tuple[Optional[MultimodalMessage], Optional[MultimodalMessage]]]

class MultimodalChatbot(Component):
    ...
    data_model = ChatbotData
```

The `data_model` s are implemented using `Pydantic V2`. Read the documentation [here](https://docs.pydantic.dev/latest/).

We've done the hardest part already!

### Part 2b - The pre and postprocess methods

For the `preprocess` method, we will keep it simple and pass a list of `MultimodalMessage` s to the python functions that use this component as input. This will let users of our component access the chatbot data with `.text` and `.files` attributes. This is a design choice that you can modify in your implementation! We can return the list of messages with the `root` property of the `ChatbotData` like so:

```python
def preprocess(
    self,
    payload: ChatbotData | None,
) -> List[MultimodalMessage] | None:
    if payload is None:
        return payload
    return payload.root
```

Learn about the reasoning behind the `preprocess` and `postprocess` methods in the [key concepts guide](https://www.gradio.app/guides/key-component-concepts)

In the `postprocess` method we will coerce each message returned by the python function to be a `MultimodalMessage` class. We will also clean up any indentation in the `text` field so that it can be properly displayed as markdown in the frontend.

We can leave the `postprocess` method as is and modify the `_postprocess_chat_messages`

```python
def _postprocess_chat_messages(
    self, chat_message: MultimodalMessage | dict | None
) -> MultimodalMessage | None:
    if chat_message is None:
        return None
    if isinstance(chat_message, dict):
        chat_message = MultimodalMessage(**chat_message)
    chat_message.text = inspect.cleandoc(chat_message.text or "")
    for file_ in chat_message.files:
        file_.file.mime_type = client_utils.get_mimetype(file_.file.path)
    return chat_message
```

Before we wrap up with the backend code, let's modify the `example_value` and `example_payload` method to return a valid dictionary representation of the `ChatbotData`:

```python
def example_value(self) -> Any:
    return [[{"text": "Hello!", "files": []}, None]]

def example_payload(self) -> Any:
    return [[{"text": "Hello!", "files": []}, None]]
```

Congrats - the backend is complete!

### Part 3a - The Index.svelte file

The frontend for the `Chatbot` component is divided into two parts - the `Index.svelte` file and the `shared/Chatbot.svelte` file. The `Index.svelte` file applies some processing to the data received from the server and then delegates the rendering of the conversation to the `shared/Chatbot.svelte` file. First we will modify the `Index.svelte` file to apply processing to the new data type the backend will return.

Let's begin by porting our custom types from our python `data_model` to typescript. Open `frontend/shared/utils.ts` and add the following type definitions at the top of the file:

```ts
export type FileMessage = {
    file: FileData
    alt_text?: string
}

export type MultimodalMessage = {
    text: string
    files?: FileMessage[]
}
```

Now let's import them in `Index.svelte` and modify the type annotations for `value` and `_value`.

```ts
import type { FileMessage, MultimodalMessage } from "./shared/utils"

export let value: [MultimodalMessage | null, MultimodalMessage | null][] = []

let _value: [MultimodalMessage | null, MultimodalMessage | null][]
```

We need to normalize each message to make sure each file has a proper URL to fetch its contents from. We also need to format any embedded file links in the `text` key. Let's add a `process_message` utility function and apply it whenever the `value` changes.

```ts
function process_message(
    msg: MultimodalMessage | null,
): MultimodalMessage | null {
    if (msg === null) {
        return msg
    }
    msg.text = redirect_src_url(msg.text)
    msg.files = msg.files.map(normalize_messages)
    return msg
}

$: _value =
    value ?
        value.map(([user_msg, bot_msg]) => [
            process_message(user_msg),
            process_message(bot_msg),
        ])
    :   []
```

### Part 3b - the Chatbot.svelte file

Let's begin similarly to the `Index.svelte` file and let's first modify the type annotations. Import `Mulimodal` message at the top of the `<script>` section and use it to type the `value` and `old_value` variables.

```ts
import type { MultimodalMessage } from "./utils"

export let value: [MultimodalMessage | null, MultimodalMessage | null][] | null
let old_value: [MultimodalMessage | null, MultimodalMessage | null][] | null =
    null
```

We also need to modify the `handle_select` and `handle_like` functions:

```ts
function handle_select(
    i: number,
    j: number,
    message: MultimodalMessage | null,
): void {
    dispatch("select", {
        index: [i, j],
        value: message,
    })
}

function handle_like(
    i: number,
    j: number,
    message: MultimodalMessage | null,
    liked: boolean,
): void {
    dispatch("like", {
        index: [i, j],
        value: message,
        liked: liked,
    })
}
```

Now for the fun part, actually rendering the text and files in the same message!

You should see some code like the following that determines whether a file or a markdown message should be displayed depending on the type of the message:

```svelte
{#if typeof message === "string"}
    <Markdown
        {message}
        {latex_delimiters}
        {sanitize_html}
        {render_markdown}
        {line_breaks}
        on:load={scroll}
    />
{:else if message !== null && message.file?.mime_type?.includes("audio")}
    <audio
        data-testid="chatbot-audio"
        controls
        preload="metadata"
        ...
```

We will modify this code to always display the text message and then loop through the files and display all of them that are present:

```svelte
<Markdown
    message={message.text}
    {latex_delimiters}
    {sanitize_html}
    {render_markdown}
    {line_breaks}
    on:load={scroll}
/>
{#each message.files as file, k}
    {#if file !== null && file.file.mime_type?.includes("audio")}
        <audio
            data-testid="chatbot-audio"
            controls
            preload="metadata"
            src={file.file?.url}
            title={file.alt_text}
            on:play
            on:pause
            on:ended
        />
    {:else if message !== null && file.file?.mime_type?.includes("video")}
        <video
            data-testid="chatbot-video"
            controls
            src={file.file?.url}
            title={file.alt_text}
            preload="auto"
            on:play
            on:pause
            on:ended
        >
            <track kind="captions" />
        </video>
    {:else if message !== null && file.file?.mime_type?.includes("image")}
        <img
            data-testid="chatbot-image"
            src={file.file?.url}
            alt={file.alt_text}
        />
    {:else if message !== null && file.file?.url !== null}
        <a
            data-testid="chatbot-file"
            href={file.file?.url}
            target="_blank"
            download={window.__is_colab__
                ? null
                : file.file?.orig_name || file.file?.path}
        >
            {file.file?.orig_name || file.file?.path}
        </a>
    {:else if pending_message && j === 1}
        <Pending {layout} />
    {/if}
{/each}
```

We did it! 🎉

### Part 4 - The demo

For this tutorial, let's keep the demo simple and just display a static conversation between a hypothetical user and a bot. This demo will show how both the user and the bot can send files. In part 2 of this tutorial series we will build a fully functional chatbot demo!

The demo code will look like the following:

```python
import gradio as gr
from gradio_multimodalchatbot import MultimodalChatbot
from gradio.data_classes import FileData

user_msg1 = {"text": "Hello, what is in this image?",
             "files": [{"file": FileData(path="https://gradio-builds.s3.amazonaws.com/diffusion_image/cute_dog.jpg")}]
             }
bot_msg1 = {"text": "It is a very cute dog",
            "files": []}

user_msg2 = {"text": "Describe this audio clip please.",
             "files": [{"file": FileData(path="cantina.wav")}]}
bot_msg2 = {"text": "It is the cantina song from Star Wars",
            "files": []}

user_msg3 = {"text": "Give me a video clip please.",
             "files": []}
bot_msg3 = {"text": "Here is a video clip of the world",
            "files": [{"file": FileData(path="world.mp4")},
                      {"file": FileData(path="cantina.wav")}]}

conversation = [[user_msg1, bot_msg1], [user_msg2, bot_msg2], [user_msg3, bot_msg3]]

with gr.Blocks() as demo:
    MultimodalChatbot(value=conversation, height=800)

demo.launch()
```

Change the filepaths so that they correspond to files on your machine. Also, if you are running in development mode, make sure the files are located in the top level of your custom component directory.

### Part 5 - Deploying and Conclusion

Let's build and deploy our demo with `gradio cc build` and `gradio cc deploy`!

You can check out our component deployed to [HuggingFace Spaces](https://huggingface.co/spaces/freddyaboulton/gradio_multimodalchatbot) and all of the source code is available [here](https://huggingface.co/spaces/freddyaboulton/gradio_multimodalchatbot/tree/main/src).

See you in the next installment of this series!

[![Gradio logo](https://www.gradio.app/_app/immutable/assets/gradiodark.CbgYRzQH.svg)](https://www.gradio.app/)
