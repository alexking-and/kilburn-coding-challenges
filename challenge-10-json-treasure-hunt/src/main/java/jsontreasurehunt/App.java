package jsontreasurehunt;

public class App {
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: `java -jar <jarfile> <path_to_map_file>`");
            System.exit(0);
        }

        TreasureMap map = new TreasureMap(args[0]);
        map.printTreasureLocations();
    }
}
