## **norminette-lint.nvim**

**A Neovim linter that uses Norminette to enforce C coding style.**

This Neovim plugin provides seamless integration with Norminette, a C code linter that helps maintain consistent and high-quality coding style. Upon saving a C file, the plugin automatically runs Norminette and displays the errors directly in your editor, making it easy to identify and fix issues.

### **Features:**

* **Norminette Integration:** Runs Norminette transparently when saving C files.
* **Error Visualization:** Displays Norminette errors directly in the editor using *virtual text*.
* **Customizable Configuration:** Allows customization of error appearance and linter execution frequency.

### **Installation:**

**Requirements:**

* **Neovim:** Version 0.5.0 or later.
* **Norminette:** Installed on your system.

**Using lazy:**

```lua
return {
    'TuTaRdrgZ/norminette-lint.nvim'
    config = function()
        require('norminette-lint').setup()
    end
}
```
