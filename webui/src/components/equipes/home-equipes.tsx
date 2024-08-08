import { Box, Typography } from "@mui/material";
import {MenuEquipe} from "./menu-equipes";

export default function HomeEquipe() {
  return (
    <Box sx={{ 
      height: "100vh", 
      display: "flex", 
      flexDirection: "row", 
      paddingLeft: "5px" 
      }}>
      <MenuEquipe />
      <Box sx={{ flexGrow: 1, display: "flex", flexDirection: "column", alignItems: "center" }}>
        <Typography variant="h3" gutterBottom>
          EQUIPES
        </Typography>
      </Box>
    </Box>
  );
}
