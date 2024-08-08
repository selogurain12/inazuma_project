import { Box, Typography } from "@mui/material";
import {MenuPersonnage} from "./menu-personnages";

export default function HomePersonnage() {
  return (
    <Box sx={{ 
      height: "100vh", 
      display: "flex", 
      flexDirection: "row", 
      paddingLeft: "5px" 
      }}>
      <MenuPersonnage />
      <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
        <Typography variant="h3" gutterBottom>
          PERSONNAGES
        </Typography>
      </Box>
    </Box>
  );
}
