# Habitat Layout Creator  
*“Your Home in Space”* — NASA Hackathon 2025 Entry  

A tool for designing modular habitat interiors in a freeform, intuitive way — not bound by rigid grids, but powered by intelligent snapping and spatial logic.  

---

## 🚀 Project Overview  
This project lets users build space habitats by placing modules, walls, equipment, and furnishings in 3D space using **custom snapping nodes**, **decoupled collision volumes**, and flexible connection logic. The focus is on freedom, adaptability, and emergent layouts rather than locked-in grid placement.  

---

## ✨ Features  
- **Multifunctional Snap Nodes**: Each snap point carries metadata (IDs, data) which can be used to define relationships, rules, or connectivity logic.  
- **Custom Bounding Boxes & Snapping Points**: Snapping regions can be tailored per module instead of relying on fixed grid bounds.  
- **Separate Collision Layer**: Snapping logic runs independently from the visible collision mesh, giving more nuanced control over placement.  
- **Combo Detection**: A root node monitors overlapping snaps and emits signals when defined ID combinations occur.  
- **Freeform Layout**: No grid constraints — modules can rotate, move, or align arbitrarily while still supporting structured placement logic.  

---

## 🛠 How It Works  
1. Each module or component has child snap nodes (`Area3D`) in the `"snap"` group.  
2. Snap nodes broadcast signals when they overlap.  
3. A root controller gathers overlaps, checks against `target_combos`, and emits `combo_detected` when matches occur.  
4. The system can then lock connections, align parts, or trigger validation logic.  

---

## 🎮 Navigation (Camera Scene)  
The project includes a **cam scene** that provides user navigation in 3D space.  
Inputs are handled through Godot’s `InputMap`. The mappings are as follows:  

- `move_forward`:  W
- `move_backward`:  S
- `move_left`:  A
- `move_right`:  D
- `move_up`:  SPACE 
- `move_down`:  SHIFT
- `Camera`:  MOUSE
- `shift node(object)`: SCROLL_UP
- `shift node(held object)`: R + SCROLL_UP    
- `Switch_mode`: B 

---

## 📦 Installation & Setup  
1. Clone this repo:  
   ```bash
   git clone https://github.com/jjf2009/Nasa-Hackathon-2025-
   ```  
2. Open the project in **Godot Engine** (version used in development).  
3. Place snap nodes on your modules and add them to the `"snap"` group.  
4. In the root layout controller, configure `target_combos` to define which ID sets should trigger special snapping behavior.  
5. Connect to the `combo_detected` signal to implement placement or module-specific logic.  

---

## 🔧 Example Usage  
If module A has snap IDs `10` and `11`, and module B has snap IDs `20` and `21`, define `[10, 20]` in `target_combos`.  
When snap `10` overlaps with snap `20`, the root emits:  

```
combo_detected([10, 20], present_ids)
```  

You can then assemble the modules or trigger alignment automatically.  

---

## 🚧 Future Improvements  
- Support **exclusive combos** (only those IDs, no extras).  
- Recursive snap gathering through parent hierarchies.  
- Visual placement feedback (highlights, ghost meshes).  
- Undo/redo placement.  
- Snap priorities (resolve conflicts gracefully).  
- Export/import layouts to JSON.  

---

## 👥 Team & Credits  
- Repository: [jjf2009 / Nasa-Hackathon-2025-](https://github.com/jjf2009/Nasa-Hackathon-2025-)  
- Built for NASA Space Apps Challenge 2025: *Your Home in Space — The Habitat Layout Creator*.  
