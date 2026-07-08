package util;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class PasswordUtil {

    // Security parameters
    private static final int SALT_LENGTH = 16;      // 16 bytes = 128 bits
    private static final int ITERATIONS = 65536;
    private static final int KEY_LENGTH = 256;      // 256 bits

     /* Generates a password hash.
        Returns: Base64(salt):Base64(hash)
     */
    public static String hash(String password) {

        try {
            // Generate random salt
            byte[] salt = new byte[SALT_LENGTH];
            SecureRandom random = new SecureRandom();
            random.nextBytes(salt);

            // Create key specification
            PBEKeySpec spec = new PBEKeySpec(
                    password.toCharArray(),
                    salt,
                    ITERATIONS,
                    KEY_LENGTH
            );

            // Generate hash
            SecretKeyFactory factory =
                    SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");

            byte[] hash = factory.generateSecret(spec).getEncoded();

            // Convert to Base64
            String saltString = Base64.getEncoder().encodeToString(salt);
            String hashString = Base64.getEncoder().encodeToString(hash);

            return saltString + ":" + hashString;

        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            throw new RuntimeException("Error while hashing password", e);
        }
    }

    /*
      Verifies a password against the stored salt:hash.
     */
    public static boolean verify(String password, String storedPassword) {

        try {

            String[] parts = storedPassword.split(":");

            if (parts.length != 2) {
                return false;
            }

            byte[] salt = Base64.getDecoder().decode(parts[0]);
            byte[] storedHash = Base64.getDecoder().decode(parts[1]);

            PBEKeySpec spec = new PBEKeySpec(
                    password.toCharArray(),
                    salt,
                    ITERATIONS,
                    KEY_LENGTH
            );

            SecretKeyFactory factory =
                    SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");

            byte[] computedHash =
                    factory.generateSecret(spec).getEncoded();

            // Constant-time comparison
            if (computedHash.length != storedHash.length) {
                return false;
            }

            int diff = 0;
            for (int i = 0; i < computedHash.length; i++) {
                diff |= computedHash[i] ^ storedHash[i];
            }

            return diff == 0;

        } catch (Exception e) {
            return false;
        }
    }
}