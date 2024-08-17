"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.toFrenchDateFormat = void 0;
function toFrenchDateFormat({ value }) {
    if (!value)
        return value;
    const date = new Date(value);
    const day = date.getDate().toString().padStart(2, '0');
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const year = date.getFullYear();
    return `${day}/${month}/${year}`;
}
exports.toFrenchDateFormat = toFrenchDateFormat;
//# sourceMappingURL=data-transform.helper.js.map