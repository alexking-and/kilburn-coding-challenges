package jsontreasurehunt;

import java.io.FileReader;
import java.util.ArrayDeque;
import java.util.Collections;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TreasureMap {
  private JsonNode root;

  public TreasureMap(String filepath) {
    this.root = readMapFile(filepath);
  }

  /**
   * Prints the locations of all treasure in the loaded map.
   */
  public void printTreasureLocations() {
    if (root.equals(null)) {
      return;
    }

    Deque<String> path = new ArrayDeque<String>();
    findTreasure(root, path);
  }

  /**
   * Finds treasure in a given node by recursing through its children.
   * 
   * @param node node to search
   * @param path stack repesenting the path from the root to the current node
   */
  private void findTreasure(JsonNode node, Deque<String> path) {
    if (node.isTextual() && node.textValue().equalsIgnoreCase("Treasure")) {
      printLocation(path);
    } else if (node.isArray()) {
      String thisKey = path.pop();
      int index = -1;
      Iterator<JsonNode> it = node.elements();
      JsonNode current = null;
      while (it.hasNext()) {
        index++;
        current = it.next();
        path.push(String.format("%s (id: %d)", thisKey, index));
        findTreasure(current, path);
        path.pop();
      }
      path.push(thisKey);
    } else if (node.isObject()) {
      Iterator<Entry<String, JsonNode>> it = node.fields();
      Entry<String, JsonNode> current = null;
      while (it.hasNext()) {
        current = it.next();
        path.push(current.getKey());
        findTreasure(current.getValue(), path);
        path.pop();
      }
    }
  }

  /**
   * Prints the location of a piece of treasure
   * 
   * @param path stack repesenting the path from the root to the current node
   */
  private void printLocation(Deque<String> path) {
    List<String> pathList = path.stream().collect(Collectors.toList());
    Collections.reverse(pathList);
    String pathString = String.join(" -> ", pathList);
    System.out.println(pathString);
  }

  /**
   * Reads a JSON file into a JsonNode object.
   * 
   * @param filepath path to the JSON map file
   */
  private JsonNode readMapFile(String filepath) {
    try {
      FileReader reader = new FileReader(filepath);
      ObjectMapper mapper = new ObjectMapper();
      JsonNode root = mapper.readTree(reader);
      return root;
    } catch (Exception e) {
      e.printStackTrace();
    }

    return null;
  }
}
