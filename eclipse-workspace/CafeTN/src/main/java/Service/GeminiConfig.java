package Service;

public class GeminiConfig {
    public static final String API_KEY = "AIzaSyCOY1ujG1RyWamp5Tgl9YNfbklogUN_Hxo";
    
    public static final String GEMINI_API_URL = 
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent";
    public static final double TEMPERATURE = 0.7;
    public static final int MAX_OUTPUT_TOKENS = 800;
    public static final double TOP_P = 0.9;
    public static final int TOP_K = 40;
    
    // Safety settings
    public static final String BLOCK_THRESHOLD = "BLOCK_MEDIUM_AND_ABOVE";
}